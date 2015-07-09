require_dependency 'project'

module SimplifyMEPhI
	module ProjectPatch
		def self.included(base)
			base.extend(ClassMethods)
			base.send(:include, InstanceMethods)

			base.class_eval do
				unloadable

				safe_attributes :type_id
				belongs_to :type, :class_name => "ProjectType"
				before_save :set_type

				class << self
					alias_method_chain :allowed_to_condition, :simplify_mephi
				end
			end
		end

		module ClassMethods
			def allowed_to_condition_with_simplify_mephi(user, permission, options={})
				# TODO: check for security (SQL injection possibility):
				"(#{allowed_to_condition_without_simplify_mephi(user, permission, options)}) AND ((projects.parent_id != 12761 OR projects.parent_id IS NULL) AND projects.id != 12761 OR projects.identifier = #{User.sanitize(user.login)})"
			end
		end
		module InstanceMethods
			def set_type
				deny_access unless User.current.admin?

				if not self.persisted?
					self.type_id ||=
						Setting.plugin_redmine_default_project_type_id['project_type_id']
				end
			end
		end
	end
end

Project.send(:include, SimplifyMEPhI::ProjectPatch)


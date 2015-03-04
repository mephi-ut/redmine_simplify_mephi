require_dependency 'project'

module SimplifyMEPhI
	module ProjectPatch
		def self.included(base)
			base.extend(ClassMethods)

			base.class_eval do
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
	end
end

Project.send(:include, SimplifyMEPhI::ProjectPatch)


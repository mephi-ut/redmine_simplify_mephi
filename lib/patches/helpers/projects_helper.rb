require_dependency 'projects_helper'

module ProjectTypesProjectsHelperPatch
	def self.included(base)
		base.extend(ClassMethods)
		base.send(:include, InstanceMethods)
		base.class_eval do
			unloadable
			alias_method_chain :project_settings_tabs, :types
		end
	end

	module ClassMethods
	end

	module InstanceMethods
		def project_settings_tabs_with_types
			tabs = project_settings_tabs_without_types
			return tabs unless User.current.admin?

			tabs.push({
				:name    => :types,
				:action  => :types,
				:partial => 'projects/settings/project_types',
				:label   => :types
			})
			return tabs
		end
	end
end

Rails.configuration.to_prepare do
	unless ProjectsHelper.included_modules.include?(ProjectTypesProjectsHelperPatch)
		ProjectsHelper.send(:include, ProjectTypesProjectsHelperPatch)
	end
end


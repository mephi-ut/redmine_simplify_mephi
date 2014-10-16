
require_dependency 'issues_controller'

module SimplifyMEPhI
	module IssuesControllerPatch
		def self.included(base)
			base.extend(ClassMethods)
			base.send(:include, InstanceMethods)

			base.class_eval do
				alias_method_chain :index, :simplify_mephi
			end
		end

		module ClassMethods
		end

		module InstanceMethods
			def index_with_simplify_mephi
				unless User.current.logged?
					redirect_to :controller => 'account', :action => 'login'
					return
				end
				index_without_simplify_mephi
			end
		end
	end
end

IssuesController.send(:include, SimplifyMEPhI::IssuesControllerPatch) unless IssuesController.included_modules.include? SimplifyMEPhI::IssuesControllerPatch


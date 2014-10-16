require_dependency 'my_controller'

module SimplifyMEPhI
	module MyControllerPatch
		def self.included(base)
			base.extend(ClassMethods)
			base.send(:include, InstanceMethods)

			base.class_eval do
				alias_method_chain :page, :simplify_mephi
			end
		end

		module ClassMethods
		end

		module InstanceMethods
			def page_with_simplify_mephi
				if User.current.logged?
					redirect_to :controller => 'issues', :action => 'index', :query_id => 10
					return
				end
				redirect_to :controller => 'account', :action => 'login'
				return
			end
		end
	end
end

MyController.send(:include, SimplifyMEPhI::MyControllerPatch) unless MyController.included_modules.include? SimplifyMEPhI::MyControllerPatch


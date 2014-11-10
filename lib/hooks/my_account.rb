module SimplifyMephi
	class Hooks < Redmine::Hook::ViewListener
		render_on :view_my_account_preferences, :partial => 'account/simplify_mephi', :layout => false
	end
end

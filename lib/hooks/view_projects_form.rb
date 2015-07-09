class SimplifyMEPhIViewProjectFormHook < Redmine::Hook::ViewListener
	# context:
	# * :form - the form builder
	# * :project - the current project
	def view_projects_form(context={})
		number_field_tag("project_type_id", context[:project].type_id)
	end
end

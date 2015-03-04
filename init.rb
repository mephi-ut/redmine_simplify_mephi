# encoding: UTF-8
require 'redmine'

require_dependency 'patches/controllers/my_controller'
require_dependency 'patches/controllers/issues_controller'
require_dependency 'patches/models/project'
require_dependency 'hooks/my_account'

Redmine::Plugin.register :redmine_simplify_mephi do
	name 'NRNU MEPhI Redmine UI simplifier'
	description 'A plugin to simplify Redmine interface for NRNU MEPhI employees'
	url 'https://github.com/mephi-ut/redmine_simplify_mephi'
	author 'Dmitry Yu Okunev'
	author_url 'https://github.com/xaionaro'
	version '0.0.1'

	delete_menu_item :top_menu, :help
	delete_menu_item :top_menu, :projects
	delete_menu_item :top_menu, :my_page

	delete_menu_item :account_menu, :register
end


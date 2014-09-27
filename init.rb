# encoding: UTF-8
require 'redmine'

Redmine::Plugin.register :redmine_simplify_mephi do
	name 'NRNU MEPhI Redmine UI simplifier'
	description 'A plugin to simplify Redmine interface for NRNU MEPhI employees'
	url 'https://github.com/mephi-ut/redmine_simplify_mephi'
	author 'Dmitry Yu Okunev'
	author_url 'https://github.com/xaionaro'
	version '0.0.1'

	delete_menu_item :top_menu, :help
	delete_menu_item :top_menu, :projects
end


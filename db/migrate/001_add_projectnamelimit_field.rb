class AddProjectnamelimitField < ActiveRecord::Migration
	def self.up
		add_column :user_preferences, :leftmenu_project_name_limit, :int, :default => 80
	end

	def self.down
		remove_column :user_preferences, :leftmenu_project_name_limit
	end
end

class CreateProjectsTypesTable < ActiveRecord::Migration
	def change
		create_table :projects_types do |t|
			t.string :name
		end
	end
end

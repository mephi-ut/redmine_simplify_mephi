class ProjectType < ActiveRecord::Base
	self.table_name = "projects_types"

        has_many :project

        attr_accessible :id
        attr_accessible :name
        attr_accessible :project_id
end

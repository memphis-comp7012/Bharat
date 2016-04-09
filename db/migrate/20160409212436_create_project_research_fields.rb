class CreateProjectResearchFields < ActiveRecord::Migration
  def change
    create_table :project_research_fields do |t|

      t.timestamps null: false
    end
  end
end

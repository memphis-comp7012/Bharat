class AddProjectRefToProjectResearchFields < ActiveRecord::Migration
  def change
    add_reference :project_research_fields, :project, index: true, foreign_key: true
  end
end

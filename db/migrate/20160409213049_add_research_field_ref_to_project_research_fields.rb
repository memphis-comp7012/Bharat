class AddResearchFieldRefToProjectResearchFields < ActiveRecord::Migration
  def change
    add_reference :project_research_fields, :research_field, index: true, foreign_key: true
  end
end

class AddDepartmentRefToResearchFields < ActiveRecord::Migration
  def change
    add_reference :research_fields, :department, index: true, foreign_key: true
  end
end

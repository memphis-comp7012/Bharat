class AddDepartmentRefToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :department, index: true, foreign_key: true
  end
end

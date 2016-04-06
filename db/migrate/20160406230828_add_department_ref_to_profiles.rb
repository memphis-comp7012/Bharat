class AddDepartmentRefToProfiles < ActiveRecord::Migration
  def change
    add_reference :profiles, :department, index: true, foreign_key: true
  end
end

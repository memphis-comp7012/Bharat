class AddProjectRefToIterations < ActiveRecord::Migration
  def change
    add_reference :iterations, :project, index: true, foreign_key: true
  end
end

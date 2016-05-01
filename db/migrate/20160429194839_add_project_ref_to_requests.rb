class AddProjectRefToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :project, index: true, foreign_key: true
  end
end

class AddProjectRefToTeam < ActiveRecord::Migration
  def change
    add_reference :teams, :project, index: true, foreign_key: true
  end
end

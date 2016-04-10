class AddProjectRefToContributions < ActiveRecord::Migration
  def change
    add_reference :contributions, :project, index: true, foreign_key: true
  end
end

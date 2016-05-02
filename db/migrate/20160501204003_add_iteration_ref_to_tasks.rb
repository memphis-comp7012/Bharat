class AddIterationRefToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :iteration, index: true, foreign_key: true
  end
end

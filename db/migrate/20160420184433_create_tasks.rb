class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.integer :status
      t.integer :assigned_user
      t.date :due_date

      t.timestamps null: false
    end
  end
end

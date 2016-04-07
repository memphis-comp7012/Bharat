class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :status
      t.string :description
      t.date :start_date
      t.date :end_date
      t.decimal :funding, precision: 10, scale: 2
      t.integer :difficulty_level

      t.timestamps null: false
    end
  end
end

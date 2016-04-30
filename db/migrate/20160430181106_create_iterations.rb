class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

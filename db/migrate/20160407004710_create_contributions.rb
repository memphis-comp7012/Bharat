class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.integer :score
      t.integer :money_received

      t.timestamps null: false
    end
  end
end

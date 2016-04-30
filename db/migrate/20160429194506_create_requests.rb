class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :type
      t.integer :status

      t.timestamps null: false
    end
  end
end

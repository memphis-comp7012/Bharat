class AddProfileRefToUser < ActiveRecord::Migration
  def change
    add_reference :users, :profile, index: true, foreign_key: true
  end
end

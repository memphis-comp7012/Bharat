class AddUserRefToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :user, index: true, foreign_key: true
  end
end

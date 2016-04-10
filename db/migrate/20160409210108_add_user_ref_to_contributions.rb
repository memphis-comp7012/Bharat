class AddUserRefToContributions < ActiveRecord::Migration
  def change
    add_reference :contributions, :user, index: true, foreign_key: true
  end
end

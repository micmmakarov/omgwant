class AddFollowingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :followers_number, :integer
    add_column :users, :following_number, :integer
  end
end

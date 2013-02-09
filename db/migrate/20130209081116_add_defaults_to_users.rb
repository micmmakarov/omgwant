class AddDefaultsToUsers < ActiveRecord::Migration
  def up
    change_column :users, :followers_number, :integer, :default => 0
    change_column :users, :following_number, :integer, :default => 0
  end

  def down
    add_column :users, :followers_number, :integer
    add_column :users, :following_number, :integer
  end
end

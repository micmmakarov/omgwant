class AddIdnumsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :instagram_id, :integer
    add_column :users, :tumblr_id, :integer
  end
end

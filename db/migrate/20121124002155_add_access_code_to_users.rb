class AddAccessCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook, :integer, :limit => 8
    add_column :users, :facebook_token, :string
  end
end

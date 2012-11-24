class AddAccessCodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook, :integer
    add_column :users, :facebook_token, :string
  end
end

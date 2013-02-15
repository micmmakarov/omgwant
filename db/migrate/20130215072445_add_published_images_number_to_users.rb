class AddPublishedImagesNumberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :images_number, :integer, :default => 0
  end
end

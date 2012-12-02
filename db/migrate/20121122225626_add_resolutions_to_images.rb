class AddResolutionsToImages < ActiveRecord::Migration
  def change
    add_column :images, :low_url, :string
    add_column :images, :thumb, :string
  end
end

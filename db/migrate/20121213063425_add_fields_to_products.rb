class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :image_id, :integer
    add_column :products, :name, :string
    add_column :products, :ssid, :integer
    add_column :products, :retailer, :string
    add_column :products, :description, :string
    add_column :products, :brandname, :string
    add_column :products, :brandid, :string
    add_column :products, :brandurl, :string
    add_column :products, :low_url, :string
    add_column :products, :big_url, :string
    add_column :products, :thumb_url, :string
  end
end

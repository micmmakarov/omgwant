class AddPublishedToImages < ActiveRecord::Migration
  def change
    add_column :images, :published, :boolean
  end
end

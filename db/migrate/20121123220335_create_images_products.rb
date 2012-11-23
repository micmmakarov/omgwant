class CreateImagesProducts < ActiveRecord::Migration
  def change
    create_table :images_products do |t|
      t.integer :image_id
      t.integer :product_id

      t.timestamps
    end

    add_index :images_products, [:image_id, :product_id], unique: true

  end
end

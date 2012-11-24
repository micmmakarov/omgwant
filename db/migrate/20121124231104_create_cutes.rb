class CreateCutes < ActiveRecord::Migration
  def change
    create_table :cutes do |t|
      t.integer :user_id
      t.integer :image_id

      t.timestamps
    end
  end
end

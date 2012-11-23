class CreateEmbeds < ActiveRecord::Migration
  def change
    create_table :embeds do |t|
      t.integer :image_id
      t.string :code

      t.timestamps
    end

    add_index :embeds, :image_id, unique: true
    add_index :embeds, :code, unique: true

  end
end

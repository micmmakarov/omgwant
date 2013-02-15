class Change < ActiveRecord::Migration
  def up
    change_column :comments, :image_id, :integer
  end

  def down
    change_column :comments, :image_id, :text
  end
end

class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :following

      t.timestamps
    end
    add_index :follows, [:following, :user_id], unique: true
  end
end

class AddCodeToImages < ActiveRecord::Migration
  def change
    add_column :images, :code, :string
  end
end

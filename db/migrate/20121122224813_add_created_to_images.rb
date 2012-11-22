  class AddCreatedToImages < ActiveRecord::Migration
  def change
    add_column :images, :created_time, :datetime
    add_column :images, :location_name, :string
  end
end

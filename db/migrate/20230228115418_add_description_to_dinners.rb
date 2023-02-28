class AddDescriptionToDinners < ActiveRecord::Migration[7.0]
  def change
    add_column :dinners, :description, :text
    add_column :dinners, :capacity, :integer
    add_column :dinners, :image_path, :string
  end
end

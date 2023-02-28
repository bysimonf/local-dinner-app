class CreateDinners < ActiveRecord::Migration[7.0]
  def change
    create_table :dinners do |t|
      t.string :title
      t.string :category
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

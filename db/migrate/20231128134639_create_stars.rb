class CreateStars < ActiveRecord::Migration[7.1]
  def change
    create_table :stars do |t|
      t.string :initial_name
      t.string :stellar_location
      t.float :price
      t.string :category
      t.text :additional_informations
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

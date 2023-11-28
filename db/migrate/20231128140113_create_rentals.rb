class CreateRentals < ActiveRecord::Migration[7.1]
  def change
    create_table :rentals do |t|
      t.string :new_name
      t.boolean :approved
      t.references :user, null: false, foreign_key: true
      t.references :star, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end

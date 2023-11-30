class AddDefaultFalseToRentalsApproved < ActiveRecord::Migration[7.1]
  def change
    change_column :rentals, :approved, :boolean, default: false
  end
end

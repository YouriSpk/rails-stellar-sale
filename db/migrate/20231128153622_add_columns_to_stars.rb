class AddColumnsToStars < ActiveRecord::Migration[7.1]
  def change
    add_column :stars, :picture_path, :string
  end
end

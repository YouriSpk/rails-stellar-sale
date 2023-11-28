class ModifyStarModel < ActiveRecord::Migration[7.1]
  def change
    remove_column :stars, :stellar_location, :string
    add_column :stars, :distance_from_earth_in_light_years, :float
    remove_column :stars, :picture_path, :string
    add_column :stars, :spectral_class, :string
    remove_column :stars, :additional_informations, :string
  end
end

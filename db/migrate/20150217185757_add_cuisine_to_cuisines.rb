class AddCuisineToCuisines < ActiveRecord::Migration
  def change
    add_column :cuisines, :cuisine, :string
  end
end

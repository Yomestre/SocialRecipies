class AddFoodTypeToFoodTypes < ActiveRecord::Migration
  def change
    add_column :food_types, :food_type, :string
  end
end

class AddFoodPreferenceToFoodPreferences < ActiveRecord::Migration
  def change
    add_column :food_preferences, :food_preference, :string
  end
end

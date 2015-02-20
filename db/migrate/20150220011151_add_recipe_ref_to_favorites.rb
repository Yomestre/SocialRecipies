class AddRecipeRefToFavorites < ActiveRecord::Migration
  def change
    add_reference :favorites, :recipe, index: true
    add_foreign_key :favorites, :recipes
  end
end

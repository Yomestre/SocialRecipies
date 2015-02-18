class AddFieldsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :name, :string
    add_column :recipes, :serving, :integer
    add_column :recipes, :cooking_time, :integer
    add_column :recipes, :difficulty_level, :string
    add_column :recipes, :ingredients, :text
    add_column :recipes, :instructions, :text
  end
end

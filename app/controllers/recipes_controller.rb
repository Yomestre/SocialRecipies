class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    save_recipe
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end
  def update
    @recipe = Recipe.find(params[:id])
    update_recipe
  end

  def destroy
  end
private
  def save_recipe
    if @recipe.save
      redirect_to @recipe
    else
      render "new"
    end
  end
  def update_recipe
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render "edit"
    end
  end
  def recipe_params
    params.require(:recipe).permit(:name, :cuisine, :food_type, :food_preference, :serving, :cooking_time, :difficulty_level, :ingredients, :instructions)
  end
end

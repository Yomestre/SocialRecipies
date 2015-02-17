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
    save_new
  end

  def edit
  end

  def destroy
  end
private
  def save_new
    if @recipe.save
      redirect_to @recipe
    else
      render "new"
    end
  end
  def recipe_params
    params.require(:recipe).permit(:name, :cuisine, :food_type, :food_preference, :serving, :cooking_time, :difficulty_level, :ingredients, :instructions)
  end
end

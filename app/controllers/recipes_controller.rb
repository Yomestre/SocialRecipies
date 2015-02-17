class RecipesController < ApplicationController
  before_action :new_authentication, only:[:new, :create]
  before_action :edit_authentication, only:[:edit, :update]
  
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
    @recipe.user_id = current_user.id
    save_recipe
  end

  def edit
  end

  def update
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
  def new_authentication
    unless admin_signed_in? || user_signed_in?
      redirect_to root_path
    end
  end
  def edit_authentication
    @recipe = Recipe.find(params[:id])
    unless admin_signed_in? || user_signed_in? && @recipe.user_id == current_user.id
      redirect_to root_path
    end
  end
  def recipe_params
    params.require(:recipe).permit(:name, :cuisine, :food_type, :food_preference, :serving, :cooking_time, :difficulty_level, :ingredients, :instructions)
  end
end

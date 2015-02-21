class RecipesController < ApplicationController
  before_action :new_authentication, only:[:new, :create]
  before_action :edit_authentication, only:[:edit, :update, :destroy]
  before_action :send_recipe_verifications , only:[:send_recipe]
  
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
    @recipe.destroy
    redirect_to root_path
  end

  def send_recipe
    @destiny = params[:destiny_email]
    @recipe =  params[:recipe_link]
    UserMailer.send_email(@destiny, @username, @recipe).deliver
    redirect_to recipes_path
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
    if !(admin_signed_in? || user_signed_in?)
      redirect_to root_path
    elsif !(admin_signed_in? || current_user.user_profile.name.present? && current_user.user_profile.city.present?)
      redirect_to edit_user_profile_path(current_user)
    end
  end
  def edit_authentication
    @recipe = Recipe.find(params[:id])
    unless admin_signed_in? || user_signed_in? && @recipe.user_id == current_user.id
      redirect_to root_path
    end
  end
  def recipe_params
    params.require(:recipe).permit(:name, :cuisine_name, :food_type_name, :food_preference_name, :serving, :cooking_time, :difficulty_level, :ingredients, :instructions, :cuisine_id, :food_preference_id, :food_type_id)
  end
  def send_recipe_verifications
    @username = current_user.user_profile.name
  end
end

class FoodPreferencesController < ApplicationController
  before_action :authenticate_admin!, except:[:index, :show]
  
  def index
    @food_preferences = FoodPreference.all
  end

  def show
    @food_preference = FoodPreference.find(params[:id])
    @recipes = @food_preference.recipes
  end

  def new
    @food_preference = FoodPreference.new
  end

  def create
    @food_preference = FoodPreference.new(food_prefenrence_params)
    save_food_preference
  end

  def edit
    @food_preference = FoodPreference.find(params[:id])
  end

  def update
    @food_preference = FoodPreference.find(params[:id])
    update_food_preference
  end

private
  def save_food_preference
    if @food_preference.save
      redirect_to @food_preference
    else
      render "new"
    end
  end

  def update_food_preference
    if @food_preference.update(food_prefenrence_params)
      redirect_to @food_preference
    else
      render "edit"
    end
  end
  def food_prefenrence_params
    params.require(:food_preference).permit(:food_preference)
  end
end

class FoodTypesController < ApplicationController
  before_action :authenticate_admin!, except:[:index, :show]
  
  def index
    @food_types = FoodType.all
  end

  def show
    @food_type = FoodType.find(params[:id])
    @recipes = @food_type.recipes
  end

  def new
    @food_type = FoodType.new
  end

  def create
    @food_type = FoodType.new(food_type_params)
    save_food_type
  end

  def edit
    @food_type = FoodType.find(params[:id])
  end

  def update
    @food_type = FoodType.find(params[:id])
    update_food_type
  end
private
  def save_food_type
    if @food_type.save
      redirect_to @food_type
    else
      render "new"
    end
  end
  def update_food_type
    if @food_type.update(food_type_params)
      redirect_to @food_type
    else
      render "edit"
    end
  end
  def food_type_params
    params.require(:food_type).permit(:food_type)
  end
end

class CuisinesController < ApplicationController
  before_action :authenticate_admin!, except:[:index, :show]

  def index
    @cuisines = Cuisine.all
  end

  def show
    @cuisine = Cuisine.find(params[:id])
    @recipes = @cuisine.recipes
  end

  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    save_cuisine
  end

  def edit
    @cuisine = Cuisine.find(params[:id])
  end

  def update
    @cuisine = Cuisine.find(params[:id])
    update_cuisine
  end
  def destroy
    Cuisine.find(params[:id]).destroy
    redirect_to root_path
  end

private
  def save_cuisine
    if @cuisine.save
      redirect_to @cuisine
    else
      render "new"
    end
  end
  def update_cuisine
    if @cuisine.update(cuisine_params)
      redirect_to @cuisine
    else
      render "edit"
    end
  end

  def cuisine_params
    params.require(:cuisine).permit(:cuisine)
  end
end
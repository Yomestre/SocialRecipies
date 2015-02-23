class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery 
  #with: :exception
  before_action :load_menu
private
  def load_menu
    @cuisine_list = Cuisine.all
    @food_preference_list = FoodPreference.all
    @food_type_list = FoodType.all
  end
end

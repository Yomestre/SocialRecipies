class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(recipe_id: params[:recipe_id])
    @favorite.user_id = current_user.id
    @favorite.save
    redirect_to recipe_path(@favorite.recipe_id)
  end
  def destroy
    @favorite = Favorite.all.where("user_id == :first AND recipe_id == :last",{first: current_user.id, last: Recipe.find(params[:id])})
    @favorite.destroy
  end
end

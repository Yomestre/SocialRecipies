class HomeController < ApplicationController
  def index
    @recipes = Recipe.last(20)
    @favorited_recipes = Recipe.most_favoriteds.first(10)
  end
end

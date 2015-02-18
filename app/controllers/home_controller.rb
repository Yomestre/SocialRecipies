class HomeController < ApplicationController
  def index
    @recipes = Recipe.last(20)
  end
end

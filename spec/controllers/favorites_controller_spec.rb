require 'rails_helper'

RSpec.describe FavoritesController, :type => :controller do
  before do
    @user1 = User.create!({
    :email => 'teste1@teste.com',
    :password => '12please',
    :password_confirmation => '12please' 
    })
    @user2 = User.create!({
    :email => 'teste2@teste.com',
    :password => '12please',
    :password_confirmation => '12please' 
    })
    @recipe1 = Recipe.create!({
    name: 'Bolo de carne',
    cooking_time: 30,
    serving: 4,
    difficulty_level: 'Facil',
    ingredients:'etc',
    instructions:'etc',
    user_id: 1,
    cuisine_id: 1,
    food_preference_id: 1,
    food_type_id: 1
    })
  end
  describe "#create" do
    it "Should favorite a recipe (User signed in)"
    it "Should redirect to sign_in_path(Admin didn't signed in)"
  end
end

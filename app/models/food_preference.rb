class FoodPreference < ActiveRecord::Base
  validates :food_preference, presence: true
end

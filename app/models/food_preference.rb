class FoodPreference < ActiveRecord::Base
  validates :food_preference, presence: true
  has_many :recipes
end

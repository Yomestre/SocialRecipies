class FoodType < ActiveRecord::Base
  validates :food_type, presence: true
  has_many :recipes
end

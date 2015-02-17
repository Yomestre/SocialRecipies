class FoodType < ActiveRecord::Base
  validates :food_type, presence: true
end

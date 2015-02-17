class Recipe < ActiveRecord::Base
  validates :name, :cuisine, :food_type, :food_preference, :ingredients, :instructions, presence: true
  validates :serving, :cooking_time, numericality: { only_integer: true }
end

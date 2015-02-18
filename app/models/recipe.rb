class Recipe < ActiveRecord::Base
  validates :name, :ingredients, :instructions, presence: true
  # :cuisine, :food_type, :food_preference,
  validates :serving, :cooking_time, numericality: { only_integer: true }
  belongs_to :user
  belongs_to :cuisine
  belongs_to :food_preference
  belongs_to :food_type
end

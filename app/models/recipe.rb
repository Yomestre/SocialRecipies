class Recipe < ActiveRecord::Base
  validates :name,:cuisine_id, :food_type_id, :food_preference_id, :ingredients, :instructions, presence: true
  # 
  validates :serving, :cooking_time, numericality: { only_integer: true }
  belongs_to :user
  belongs_to :cuisine
  belongs_to :food_preference
  belongs_to :food_type
end

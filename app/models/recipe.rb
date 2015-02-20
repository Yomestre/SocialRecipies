class Recipe < ActiveRecord::Base
  has_many :favorites
  belongs_to :user
  belongs_to :cuisine
  belongs_to :food_preference
  belongs_to :food_type
  validates :name,:cuisine_id, :food_type_id, :food_preference_id, :ingredients, :instructions, presence: true
  validates :serving, :cooking_time, numericality: { only_integer: true }
  def self.most_favoriteds
    joins(:favorites).select("count(*) as num, recipes.*").group("favorites.recipe_id").order("1 desc")
  end
end
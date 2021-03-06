class Recipe < ActiveRecord::Base
  has_many :favorites
  belongs_to :user
  belongs_to :cuisine
  belongs_to :food_preference
  belongs_to :food_type
  validates :name,:cuisine_id, :food_type_id, :food_preference_id, :ingredients, :instructions, presence: true
  validates :serving, :cooking_time, numericality: { only_integer: true }
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  def self.most_favoriteds
    joins(:favorites).select("count(*) as num, recipes.*").group("favorites.recipe_id").order("1 desc")
  end
end
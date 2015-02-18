class Cuisine < ActiveRecord::Base
  validates :cuisine, presence: true
  has_many :recipes
end

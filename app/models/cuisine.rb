class Cuisine < ActiveRecord::Base
  validates :cuisine, presence: true
end

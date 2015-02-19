class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :user_profile
  has_many :recipes
  after_create :build_profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def build_profile
    @profile = UserProfile.new
    @user = User.last
    @profile.user_id = @user.id
    @profile.email = @user.email
    @profile.save
  end
end

class UserProfilesController < ApplicationController
  before_action :index_authentication, only:[:index]
  before_action :edit_authentication, only:[:edit, :update]

  def index
    @user_profile = current_user.user_profile
    @recipes = @user_profile.user.recipes
  end

  def show
    @user_profile = UserProfile.find(params[:id])
    @recipes = @user_profile.user.recipes
  end

  def edit
  end

  def update
    update_user_profile
  end

private
  def index_authentication
    unless user_signed_in? 
      redirect_to root_path
    end
  end
  def edit_authentication
    @user_profile = UserProfile.find(params[:id])
    unless admin_signed_in? || user_signed_in? && @user_profile.user_id == current_user.id
      redirect_to root_path
    end
  end
  def update_user_profile
    if @user_profile.update(user_profile_params)
      redirect_to @user_profile
    else
      render "edit"
    end
  end
  def user_profile_params
    params.require(:user_profile).permit(:name, :city, :facebook, :twitter, :cuisine_preference)
  end
end

class AddUserRefToUserProfiles < ActiveRecord::Migration
  def change
    add_reference :user_profiles, :user, index: true
    add_foreign_key :user_profiles, :users
  end
end

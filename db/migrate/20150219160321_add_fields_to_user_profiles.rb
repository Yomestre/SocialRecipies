class AddFieldsToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :name, :string
    add_column :user_profiles, :city, :string
    add_column :user_profiles, :email, :string
    add_column :user_profiles, :facebook, :string
    add_column :user_profiles, :twitter, :string
    add_column :user_profiles, :cuisine_preference, :text
  end
end

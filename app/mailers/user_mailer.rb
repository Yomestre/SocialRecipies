class UserMailer < ApplicationMailer
  default from: "SocialRecipesGustavo@gmail.com"
  def send_email(destiny)
    @destiny = destiny
    @user = current_user
    mail(to: destiny.email, subject: 'Recipe')
  end
end

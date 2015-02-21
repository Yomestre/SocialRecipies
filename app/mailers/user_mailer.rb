class UserMailer < ApplicationMailer
  default from: "SocialRecipesGustavo@gmail.com"
  def send_email(destiny, username, recipe_link)
    @destiny = destiny
    @username = username
    @recipe = recipe_link
    mail(to: destiny, subject: 'Recipe')
  end
end

# frozen_string_literal: true

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate_user!, raise: false

  def google_oauth2
    auth = request.env['omniauth.auth']
    user = User.where(provider: auth['provider'], uid: auth['uid'])
               .first_or_initialize(email: auth['info']['email'])
    user.username ||= auth['info']['name']
    user.first_name ||= auth['info']['first_name']
    user.last_name ||= auth['info']['last_name']
    # user.password = SecureRandom.hex(10)
    user.password = 'password'
    user.save!

    user.remember_me = true
    sign_in(:user, user)

    redirect_to after_sign_in_path_for(user)
    flash[:success] = 'You are now signed in through Google!'
  end
end

class OmniauthCallbacksController < ApplicationController
  def facebook
    generic_callback('facebook')
  end

  def twitter
    generic_callback('twitter')
  end

  def google_oauth2
    generic_callback('google_oauth2')
  end

  def generic_callback(provider)
    @identity = Identity.find_for_oauth(request.env['omniauth.auth'])

    @user = @identity.user || current_user
    if @user.nil?
      @user = User.create(email: @identity.email || '')
      @identity.update_attribute(:user_id, @user.id)
    end

    if @user.email.blank? && @identity.email
      @user.update_attribute(:email, @identity.email)
    end

    if @user.persisted?
      @identity.update_attribute(:user_id, @user.id)
      @user = FormUser.find @user.id
      sign_in_and_redirect @user, event: :authentication
      flash[:success] = "Welcome, #{@identity.name}!"
    else
      session["devise.#{provider}_data"] = env['omniauth.auth']
      redirect_to new_user_registration_url
      flash[:warning] = 'There was an error while trying to authenticate you...'
    end
  end
end

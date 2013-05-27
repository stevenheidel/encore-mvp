class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
  end

  def twitter
    @user = User.find_for_twitter_oauth(request.env["omniauth.auth"], current_user)

    sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
  end

  def instagram
    @user = User.find_for_instagram_oauth(request.env["omniauth.auth"], current_user)

    sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
  end
end
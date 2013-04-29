class WelcomeController < ApplicationController
  def profile
    if user_signed_in?
      @concerts = current_user.concerts
    else
      render :default_profile
    end
  end
end
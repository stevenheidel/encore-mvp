class WelcomeController < ApplicationController
  before_filter :authenticate_user!, :except => :index

  def index
    # FOR TESTING, reload the welcome page to automagically log in
    if Rails.env.development? and false
      sign_in(:user, User.find_by_id(2)) if session[:test]
      session[:test] = true
    end

    redirect_to :controller => :concerts, :action => :show, :id => ENV['CURRENT_CONCERT_ID'] if user_signed_in?
  end

  def profile
    @concerts = current_user.concerts
  end
end
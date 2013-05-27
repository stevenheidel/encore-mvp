class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :index

  def index
    redirect_to :controller => :concerts, :action => :show, :id => ENV['CURRENT_CONCERT_ID'] if user_signed_in?
  end

  def profile
    @concerts = current_user.concerts
  end
end
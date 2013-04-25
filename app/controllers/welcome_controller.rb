class WelcomeController < ApplicationController
  before_filter :authenticate_user!, :except => :index

  def index
    redirect_to :controller => :concerts, :action => :show, :id => ENV['CURRENT_CONCERT_ID'] if user_signed_in?
  end

  def profile
    @concerts = current_user.concerts
  end
end
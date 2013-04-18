class WelcomeController < ApplicationController
  before_filter :authenticate_user!, :except => :index

  def index
    redirect_to :action => :profile if user_signed_in?
  end

  def profile
    @concerts = Concert.all
  end
end
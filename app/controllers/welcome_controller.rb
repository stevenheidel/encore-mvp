class WelcomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def index
    redirect_to :action => :profile if user_signed_in?
  end

  def profile
    redirect_to :action => :profile unless user_signed_in?

    @concerts = Concert.all
  end
end
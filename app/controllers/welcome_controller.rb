class WelcomeController < ApplicationController
  before_filter :authenticate_user!, :except => :index

  def index
    session[:current_concert_id] = params[:concert_id] if params[:concert_id]
    redirect_to :action => :profile if user_signed_in?
  end

  def profile
    concert = Concert.find_by_id(session[:current_concert_id])
    current_user.add_concert(concert)
    @concerts = current_user.concerts
  end
end
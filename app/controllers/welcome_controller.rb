class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :index

  def index
    if user_signed_in?
      concert = Concert.find_by_id(ENV['CURRENT_CONCERT_ID'].to_i)
      current_user.add_concert(concert)

      redirect_to :action => :profile
    end
  end

  def profile
    @concerts = current_user.concerts
  end
end
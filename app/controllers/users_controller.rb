class UsersController < ApplicationController
  def signup
    current_user.provided_email = params[:email]
    current_user.provided_phone = params[:phone]
    current_user.save
    
    render :nothing => true
  end
end
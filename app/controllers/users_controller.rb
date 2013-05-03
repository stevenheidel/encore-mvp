class UsersController < ApplicationController
  def signup
    user = current_user || User.create(
      :name => "Anonymous",
      :email => ('a'..'z').to_a.shuffle[0,9].join # email is unique so just make a random one
    )

    user.provided_email = params[:email]
    user.provided_phone = params[:phone]
    user.save

    session[:current_user_signed_up] = true
    
    render :nothing => true
  end

  def favourite
    post = Post.find_by_id(params[:id])
    current_user.toggle_favourite(post)

    render :nothing => true
  end
end
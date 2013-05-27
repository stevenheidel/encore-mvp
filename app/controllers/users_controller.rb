class UsersController < ApplicationController
  def favourite
    post = Post.find_by_id(params[:id])
    current_user.toggle_favourite(post)

    render :nothing => true
  end
end
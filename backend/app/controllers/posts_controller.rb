class PostsController < InheritedResources::Base
  def index
    super do |format|
      format.json { render json: { posts: @posts } }
    end
  end
end

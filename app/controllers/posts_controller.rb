class PostsController < InheritedResources::Base
  before_filter :authenticate_user!

  belongs_to :concert
end

class SetlistsController < InheritedResources::Base
  before_filter :authenticate_user!

  belongs_to :concert

  def index
    index! do 
      @setlists = @setlists.reorder('id')
    end
  end
end

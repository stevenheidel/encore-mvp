class SetlistsController < InheritedResources::Base
  belongs_to :concert

  protected
    
    def collection
      @setlists ||= end_of_association_chain.order("id")
    end
end

class ConcertListingsController < InheritedResources::Base
  before_filter :authenticate_user!

  def index
    index! do
      @listing_dates = @concert_listings.group_by {|l| l.date}
    end
  end

  protected
    
    def collection
      @concert_listings ||= end_of_association_chain.order("date ASC, title ASC")
    end
end

class DealsController < InheritedResources::Base
  before_filter :authenticate_user!

  def index
    index! do
      @deal_categories = @deals.group_by {|d| d.category}
    end
  end

  protected
    
    def collection
      @deals ||= end_of_association_chain.order("category ASC, title ASC")
    end
end

class ConcertsController < InheritedResources::Base
  respond_to :json, :only => :index

  def show
    @hearts = []

    if user_signed_in?
      # Add concert to current user
      concert = Concert.find_by_id(params[:id])
      current_user.add_concert(concert)

      # Find liked post ids
      @hearts = current_user.posts.map{|p| p.id}
    end

    show!
  end
end
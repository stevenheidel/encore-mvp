class ConcertsController < InheritedResources::Base
  before_filter :authenticate_user!

  def show
    # Add concert to current user
    concert = Concert.find_by_id(params[:id])
    current_user.add_concert(concert)

    show!
  end
end
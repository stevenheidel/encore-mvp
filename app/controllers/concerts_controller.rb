class ConcertsController < InheritedResources::Base
  def show
    if user_signed_in?
      # Add concert to current user
      concert = Concert.find_by_id(params[:id])
      current_user.add_concert(concert)
    end

    show!
  end
end
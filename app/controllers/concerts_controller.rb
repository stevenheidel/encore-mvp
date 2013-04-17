class ConcertsController < InheritedResources::Base
  def index
    super do |format|
      format.json { render json: { concerts: @concerts } }
    end
  end
end
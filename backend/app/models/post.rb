class Post < ActiveRecord::Base
  attr_accessible :concert_id, :link, :network

  belongs_to :concert
end

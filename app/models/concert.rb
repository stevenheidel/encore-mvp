class Concert < ActiveRecord::Base
  attr_accessible :date, :facebook_page, :hashtag, :instagram, :title, :twitter, :venue, :venue_lat, :venue_long

  has_many :posts
end

class Concert < ActiveRecord::Base
  attr_accessible :date, :facebook_page, :hashtag, :instagram, :title, :twitter, :venue, :venue_lat, :venue_long
  attr_accessible :picture

  has_many :posts
  has_and_belongs_to_many :users, :uniq => true

  has_attached_file :picture, styles: {
    thumb: '100x100>',
    medium: '165x165>'
  }
end

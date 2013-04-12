class Concert < ActiveRecord::Base
  attr_accessible :date, :facebook_page, :hashtag, :instagram, :title, :twitter, :venue

  has_many :posts
end

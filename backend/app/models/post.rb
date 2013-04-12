class Post < ActiveRecord::Base
  attr_accessible :concert_id, :link, :network, :published

  belongs_to :concert
end

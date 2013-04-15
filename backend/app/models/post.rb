class Post < ActiveRecord::Base
  attr_accessible :concert_id, :link, :network, :published, :medium, :text, :image_url, :filter_score

  belongs_to :concert

  validates_uniqueness_of :link
end

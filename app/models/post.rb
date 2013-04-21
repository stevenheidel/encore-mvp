class Post < ActiveRecord::Base
  attr_accessible :concert_id, :link, :network, :published, :medium, :text, :image_url, :filter_score
  attr_accessible :user_name, :user_image_url

  belongs_to :concert

  validates_uniqueness_of :link
end

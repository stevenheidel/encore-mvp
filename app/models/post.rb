class Post < ActiveRecord::Base
  attr_accessible :concert_id, :link, :network, :published, :medium, :text, :image_url, :filter_score
  attr_accessible :user_name, :user_image_url

  belongs_to :concert

  has_and_belongs_to_many :users, :uniq => true

  validates_uniqueness_of :link

  scope :published, where(:published => true)
end

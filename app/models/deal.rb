class Deal < ActiveRecord::Base
  attr_accessible :category, :concert_id, :description, :price, :title

  has_attached_file :picture, styles: {
    thumb: '80x80>'
  }
end

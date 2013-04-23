class ConcertListing < ActiveRecord::Base
  attr_accessible :description, :title, :date

  has_attached_file :picture, styles: {
    thumb: '80x80>'
  }
end

class Setlist < ActiveRecord::Base
  attr_accessible :artist, :itunes, :song
  attr_accessible :picture

  belongs_to :concert

  has_attached_file :picture, styles: {
    thumb: '80x80>'
  }
end

class AddPictureToListings < ActiveRecord::Migration
  def up
    add_attachment :concert_listings, :picture
  end

  def down
    remove_attachment :concert_listings, :picture
  end
end

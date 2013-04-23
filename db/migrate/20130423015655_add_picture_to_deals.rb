class AddPictureToDeals < ActiveRecord::Migration
  def up
    add_attachment :deals, :picture
  end

  def down
    remove_attachment :deals, :picture
  end
end

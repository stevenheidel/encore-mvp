class AddPictureToSetLists < ActiveRecord::Migration
  def up
    add_attachment :setlists, :picture
  end

  def down
    remove_attachment :setlists, :picture
  end
end

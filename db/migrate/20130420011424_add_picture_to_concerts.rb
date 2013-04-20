class AddPictureToConcerts < ActiveRecord::Migration
  def up
    add_attachment :concerts, :picture
  end

  def down
    remove_attachment :concerts, :picture
  end
end

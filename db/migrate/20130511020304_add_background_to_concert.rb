class AddBackgroundToConcert < ActiveRecord::Migration
  def up
    add_attachment :concerts, :background
  end

  def down
    remove_attachment :concerts, :background
  end
end

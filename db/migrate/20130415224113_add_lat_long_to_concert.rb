class AddLatLongToConcert < ActiveRecord::Migration
  def change
    add_column :concerts, :venue_lat, :decimal
    add_column :concerts, :venue_long, :decimal
  end
end

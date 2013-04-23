class AddDateToConcertListings < ActiveRecord::Migration
  def change
    add_column :concert_listings, :date, :date
  end
end

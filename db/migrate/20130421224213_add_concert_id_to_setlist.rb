class AddConcertIdToSetlist < ActiveRecord::Migration
  def change
    add_column :setlists, :concert_id, :integer
  end
end

class CreateConcertListings < ActiveRecord::Migration
  def change
    create_table :concert_listings do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end

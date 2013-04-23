class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.integer :concert_id
      t.string :title
      t.text :description
      t.decimal :price
      t.string :category

      t.timestamps
    end
  end
end

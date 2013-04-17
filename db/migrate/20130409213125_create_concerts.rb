class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :title
      t.datetime :date
      t.string :venue
      t.string :hashtag
      t.string :facebook_page
      t.string :twitter
      t.string :instagram

      t.timestamps
    end
  end
end

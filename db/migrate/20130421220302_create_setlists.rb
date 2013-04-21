class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|
      t.string :song
      t.string :artist
      t.string :itunes

      t.timestamps
    end
  end
end

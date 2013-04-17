class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :network
      t.string :link
      t.integer :concert_id

      t.timestamps
    end
  end
end

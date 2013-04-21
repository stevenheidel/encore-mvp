class CreateConcertUserJoinTable < ActiveRecord::Migration
  def change
    create_table :concerts_users, :id => false do |t|
      t.integer :concert_id
      t.integer :user_id
    end
  end
end

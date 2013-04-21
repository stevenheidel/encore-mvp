class AddUserNameAndImageToPost < ActiveRecord::Migration
  def change
    add_column :posts, :user_name, :string
    add_column :posts, :user_image_url, :string
  end
end

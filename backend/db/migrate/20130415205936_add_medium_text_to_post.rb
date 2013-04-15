class AddMediumTextToPost < ActiveRecord::Migration
  def change
    add_column :posts, :medium, :string
    add_column :posts, :text, :text
  end
end

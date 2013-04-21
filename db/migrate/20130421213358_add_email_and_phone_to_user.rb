class AddEmailAndPhoneToUser < ActiveRecord::Migration
  def change
    add_column :users, :provided_email, :text
    add_column :users, :provided_phone, :text
  end
end

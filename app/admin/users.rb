ActiveAdmin.register User do
  index do
    column :id
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :current_sign_in_ip
    column :last_sign_in_ip
    column :created_at
    column :updated_at
    column :provider
    column :uid
    column :name
    column :provided_email
    column :provided_phone
    default_actions
  end

  filter :email
  filter :provider
  filter :uid
  filter :name
  filter :provided_email
  filter :provided_name
end

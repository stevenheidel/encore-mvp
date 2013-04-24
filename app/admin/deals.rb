ActiveAdmin.register Deal do
  belongs_to :concert
  navigation_menu :concert

  index do   
    selectable_column
    column :id
    column "Picture" do |deal|
      image_tag deal.picture.url(:thumb)
    end
    column :title
    column :description
    column :price
    column :category
    default_actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :title
      f.input :description
      f.input :price
      f.input :category
      f.input :picture, :as => :file, :hint => f.template.image_tag(f.object.picture.url(:thumb))
    end
    f.actions
  end
end
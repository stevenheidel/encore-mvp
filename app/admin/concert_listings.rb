ActiveAdmin.register ConcertListing do
  index do   
    selectable_column
    column :id
    column "Picture" do |concert_listing|
      image_tag concert_listing.picture.url(:thumb)
    end
    column :title
    column :description
    default_actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :title
      f.input :description
      f.input :picture, :as => :file, :hint => f.template.image_tag(f.object.picture.url(:thumb))
    end
    f.actions
  end
end
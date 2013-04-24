ActiveAdmin.register Setlist do
  belongs_to :concert
  navigation_menu :concert

  index do   
    selectable_column
    column :id
    column "Picture" do |setlist|
      image_tag setlist.picture.url(:thumb)
    end
    column :song
    column :artist
    column :itunes
    default_actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :song
      f.input :artist
      f.input :itunes
      f.input :picture, :as => :file, :hint => f.template.image_tag(f.object.picture.url(:thumb))
    end
    f.actions
  end
end
ActiveAdmin.register Setlist do
  belongs_to :concert
  navigation_menu :concert

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
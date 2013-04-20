ActiveAdmin.register Concert do
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :title
      f.input :date, :as => :date
      f.input :venue
      f.input :venue_lat
      f.input :venue_long
      f.input :picture, :as => :file, :hint => f.template.image_tag(f.object.picture.url(:thumb))
      f.input :facebook_page
      f.input :twitter
      f.input :hashtag
      f.input :instagram
    end
    f.actions
  end
end

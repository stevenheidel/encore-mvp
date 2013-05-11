ActiveAdmin.register Concert do
  index do   
    selectable_column
    column :id
    column "Picture" do |concert|
      link_to image_tag(concert.picture.url(:thumb)), admin_concert_posts_path(concert)
    end                  
    column :title                     
    column :date        
    column :venue           
    default_actions           
  end

  filter :title
  filter :date
  filter :venue

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :title
      f.input :date, :as => :date
      f.input :venue
      f.input :venue_lat
      f.input :venue_long
      f.input :picture, :as => :file, :hint => f.template.image_tag(f.object.picture.url(:thumb))
      f.input :background, :as => :file, :hint => f.template.image_tag(f.object.background.url(:default))
      f.input :facebook_page
      f.input :twitter
      f.input :hashtag
      f.input :instagram
    end
    f.actions
  end
end

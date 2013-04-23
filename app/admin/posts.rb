ActiveAdmin.register Post do
  belongs_to :concert
  navigation_menu :concert

  batch_action :unpublish do |selection|
    concert = nil

    Post.find(selection).each do |post|
      concert = post.concert
      post.published = false
      post.save
    end

    redirect_to admin_concert_posts_path(concert)
  end

  batch_action :publish do |selection|
    concert = nil

    Post.find(selection).each do |post|
      concert = post.concert
      post.published = true
      post.save
    end

    redirect_to admin_concert_posts_path(concert)
  end

  config.filters = false

  index do
    selectable_column
    column "Picture" do |post|
      link_to image_tag(post.image_url), admin_concert_post_path(concert, post)
    end
    column :text
    column :filter_score
    column :published
    column :link do |post|
      link_to post.link, post.link
    end
    default_actions
  end
end

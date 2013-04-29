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

  actions :all, :except => [:edit]

  form do |f|
    f.inputs "Details" do
      f.input :link
      f.input :published
    end
    f.actions
  end

  controller do
    def create
      create! { find_remaining_info @post }
    end

    def update
      update! { find_remaining_info @post }
    end

    # automatically fill in field based on link
    def find_remaining_info(post)
      regex = /(http|https):\/\/(www.)?(?<network>instagram|twitter|vine|youtube).+(\/|=)(?<id>\w+)\/?/
      match_data = regex.match(post.link)
      
      post.network = match_data[:network].titlecase
      id = match_data[:id]

      case post.network
      when "Instagram"
        Instagram.configure do |config|
          config.client_id = "245d5992fc774b1db8d0b93db5c0ffb6"
        end

        media = Instagram.media_item(Instagram.oembed(post.link).media_id)

        post.text = media.caption.text
        post.image_url = media.images.low_resolution.url

        post.user_name = media.caption.from.full_name
        post.user_image_url = media.caption.from.profile_picture
      when "Twitter"
        
      when "Vine"

      when "Youtube"

      end

      post.save
    end
  end
end

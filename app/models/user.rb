class User < ActiveRecord::Base
  devise :trackable
  devise :omniauthable, :omniauth_providers => [:facebook, :twitter, :instagram]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :provider, :uid
  attr_accessible :name, :profile_image_url
  attr_accessible :provided_email, :provided_phone

  has_and_belongs_to_many :concerts, :uniq => true
  has_and_belongs_to_many :posts, :uniq => true

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first

    unless user
      user = User.create(name: auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: auth.info.email,
                         profile_image_url: auth.info.image.sub("type=square", "width=80&height=80")
                        )
    end

    user
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first

    unless user
      user = User.create(name: auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: auth.extra.raw_info.screen_name, # can't get email from Twitter
                         profile_image_url: auth.extra.raw_info.profile_image_url.sub("normal", "bigger")
                        )
    end

    user
  end

  def self.find_for_instagram_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first

    unless user
      user = User.create(name: auth.info.name,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: auth.info.nickname, # can't get email from Instagram
                         profile_image_url: auth.info.image
                        )
    end

    user
  end

  def add_concert(concert)
    if concert
      self.concerts << concert unless self.concerts.include?(concert)
    end
  end

  def toggle_favourite(post)
    if post
      if self.posts.include?(post)
        # Remove from favourites
        self.posts.delete(post)
      else
        # Add to favourites
        self.posts << post
      end
    end
  end
end

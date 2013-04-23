class User < ActiveRecord::Base
  devise :trackable
  devise :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :provider, :uid
  attr_accessible :name
  attr_accessible :provided_email, :provided_phone

  has_and_belongs_to_many :concerts, :uniq => true
  has_and_belongs_to_many :posts, :uniq => true

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first

    unless user
      user = User.create(name: auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: auth.info.email
                        )
    end

    user
  end

  def add_concert(concert)
    if concert
      self.concerts << concert unless self.concerts.include?(concert)
    end
  end

  def signed_up?
    self.provided_email || self.provided_phone
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

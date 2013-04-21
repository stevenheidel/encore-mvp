class User < ActiveRecord::Base
  devise :trackable
  devise :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :provider, :uid
  attr_accessible :name

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

  def add_concert(concert_id)
    if concert = Concert.find_by_id(concert_id)
      self.concerts << concert unless self.concerts.include?(concert)
    end
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable,
           :omniauthable, omniauth_providers: [:github]

    validates :name,presence: true, uniqueness: true 
    validates :email, presence: true , uniqueness: true

    has_one_attached :avatar

    has_many :comments, dependent: :destroy
    
    has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow", dependent: :destroy
    has_many :followers, through: :received_follows, source: :follower, dependent: :destroy

    has_many :given_follows, foreign_key: :follower_id, class_name: "Follow", dependent: :destroy
    has_many :followings, through: :given_follows, source: :followed_user, dependent: :destroy

    has_many :likes, foreign_key: :liking_user_id, dependent: :destroy
    has_many :liked_posts, through: :likes, source: :liked_post, dependent: :destroy
    has_many :authored_posts, foreign_key: :author_id, class_name: "Post", dependent: :destroy

    def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first
  
      # Uncomment the section below if you want users to be created if they don't exist
       unless user
           user = User.create(name: data['name'],
              email: data['email'],
              password: Devise.friendly_token[0,20]
           )
       end
      user
  end
end

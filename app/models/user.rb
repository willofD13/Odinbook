class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
    validates :name, presence: true, uniqueness: true 
    validates :email, presence: true , uniqueness: true

    has_many :comments, dependent: :destroy
    
    has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow", dependent: :destroy
    has_many :followers, through: :received_follows, source: :follower, dependent: :destroy

    has_many :given_follows, foreign_key: :follower_id, class_name: "Follow", dependent: :destroy
    has_many :followings, through: :given_follows, source: :followed_user, dependent: :destroy

    has_many :likes, foreign_key: :liking_user_id, dependent: :destroy
    has_many :liked_posts, through: :likes, source: :liked_post, dependent: :destroy
    has_many :authored_posts, foreign_key: :author_id, class_name: "Post", dependent: :destroy
end

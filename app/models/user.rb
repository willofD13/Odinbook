class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true 
    validates :email, presence: true , uniqueness: true
    
    has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"
    has_many :followers, through: :received_follows, source: :follower

    has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"
    has_many :followings, through: :given_follows, source: :followed_user

    has_many :likes, foreign_key: :liking_user_id
    has_many :liked_posts, through: :likes, source: :liked_post
    has_many :authored_posts, foreign_key: :author_id, class_name: "Post"
end

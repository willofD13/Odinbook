class Post < ApplicationRecord
    validates :body, presence: true

    has_many :comments, dependent: :destroy
    has_many :likes, foreign_key: :liked_post_id, dependent: :destroy
    has_many :users_who_liked_this, through: :likes, source: :liking_user, dependent: :destroy
    belongs_to :author, foreign_key: :author_id, class_name: "User"
end

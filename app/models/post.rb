class Post < ApplicationRecord
    validates :body, presence: true

    has_many :likes, foreign_key: :liked_post_id
    has_many :users_who_liked_this, through: :likes, source: :liking_user
    belongs_to :author, foreign_key: :author_id, class_name: "User"
end

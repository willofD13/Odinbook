class Post < ApplicationRecord
    validates :body, presence: true

    has_many :likes, foreign_key: :liked_post_id
end

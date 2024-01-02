class Like < ApplicationRecord
    belongs_to :liking_user, foreign_key: :liking_user_id, class_name: "User"
    belongs_to :liked_post, foreign_key: :liked_post_id, class_name: "Post"
end

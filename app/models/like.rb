class Like < ApplicationRecord
    belongs_to :liking_user, foreign_key: :liking_user_id, class_name: "User"
end

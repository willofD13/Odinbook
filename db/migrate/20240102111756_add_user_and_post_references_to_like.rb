class AddUserAndPostReferencesToLike < ActiveRecord::Migration[7.1]
  def change
    add_column :likes, :liking_user_id, :integer
    add_column :likes, :liked_post_id, :integer
  end
end

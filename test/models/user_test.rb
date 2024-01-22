require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do 
    @first_user = users(:one) 
    @second_user = users(:two) 
    @first_post = posts(:one)
    @second_post = posts(:two)
    @comment = comments(:one)
    @follow = follows(:one)
  end 

  test "user creation" do 
    u = User.new
    assert_not u.save 
  end

  test "user authored posts" do 
    assert_includes(@first_user.authored_posts, @first_post)
  end

  test "user liked posts" do 
    assert_includes(@first_user.liked_posts, @second_post)
  end

  test "user and post comments" do 
    assert_includes(@first_user.comments, @comment)
    assert_includes(@first_post.comments, @comment)
  end

  test "user follows" do 
    assert_includes(@first_user.received_follows, @follow)
    assert_includes(@first_user.followers, @second_user)
  end
end

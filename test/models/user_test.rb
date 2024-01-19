require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "user creation" do 
    u = User.new
    assert_not u.save 
  end
end

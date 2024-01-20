require "test_helper"

class FollowTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'follow creation' do 
    follow = Follow.new
    assert_not follow.save
  end
end

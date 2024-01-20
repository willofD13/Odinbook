require "test_helper"

class OdinbookFlowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'visiting home page' do 
    user = users(:one)
    sign_in user

    get '/'

    assert_select 'h3', 'Users you follow:'
  end
end

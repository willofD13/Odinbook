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

  test 'post creation' do
    user = users(:one)
    sign_in user

    get '/'
    get "/posts/new"
    assert_response :success

    post posts_url,
      params: { 'post'=> { 'body'=> "post successfull", 'author_id'=> users(:one).id } }, as: :turbo_stream
    
    assert_response :success
    assert_select "strong", "post successfull"

  end
end

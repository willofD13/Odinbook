require "test_helper"

class OdinbookFlowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'visiting home page' do 
    user = users(:one)
    sign_in user

    get '/'

    assert_response :success
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

  test 'visiting profile page' do 
    user = users(:one) 
    sign_in user 

    get user_path(user.id)

    assert_response :success
    assert_select "h2", "#{user.name}"
  end

  test 'visiting users page' do 
    user = users(:one) 
    sign_in user 

    get users_path

    assert_response :success
    assert_select "h1", "Users"
  end

  test 'edit account page' do 
    user = users(:one) 
    sign_in user 

    get edit_user_registration_path

    assert_response :success
    assert_select "h2", "Edit User"
  end
end

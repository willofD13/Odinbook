require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit comments_url
  #
  #   assert_selector "h1", text: "Comment"
  # end
  test 'submitting a comment' do 
    user = users(:one)
    sign_in user 

    visit root_path

    click_on 'See post'

    fill_in 'comment_body', with: 'testing comments'

    click_button 'Create Comment'

    assert_text 'testing comments'
  end
end

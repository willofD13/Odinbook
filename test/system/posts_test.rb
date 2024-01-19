require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  
   test "visiting the index" do
     visit posts_path
  
     assert_selector "h2", text: "Log in"
   end

   test "creating a post" do
    user = users(:one)
    sign_in user 

    visit root_path

    fill_in "post[body]", with: "Testing posts!"

    click_on "Create post"
 
    assert_text "Testing posts!"
  end
end

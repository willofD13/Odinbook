require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
   test "visiting the index" do
     visit posts_path
  
     assert_selector "h2", text: "Log in"
   end
end

require "application_system_test_case"

class DeviseOauthsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit devise_oauths_url
  #
  #   assert_selector "h1", text: "DeviseOauth"
  # end

  test 'signing in existing user' do 
    user = users(:one)
    sign_in user 

    visit root_path
    assert_current_path root_path
  end
end

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

  test 'creating a user and sign in' do 
    name = Faker::Name.name 
    email = Faker::Internet.email 
    password = Faker::Internet.password(min_length: 10, max_length: 30)
    

    visit root_path

    click_on 'Sign up'

    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password


    click_button 'Sign up'

    assert_current_path root_path
  end
end

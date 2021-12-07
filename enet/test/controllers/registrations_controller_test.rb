require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get registrations_url
    assert_response :success
  end


  test "should register new user" do
    post registrations_url, params: { email: 'new_user@enet.com', password: 'password', password_confirmation: 'password', modules: [university_modules(:one).id] }
    assert_redirected_to dashboard_path
  end

  test 'should not register new user with invalid email' do
    post registrations_url, params: { email: users(:one).email, password: 'password', password_confirmation: 'password', modules: [university_modules(:one).id] }
    assert_equal 'The email address you have entered is already in use. Please try another email address.', flash[:error]
  end

  test 'should not register new user with no modules selected' do
    post registrations_url, params: { email: 'tester1@enet.com', password: 'password', password_confirmation: 'password' }
    assert_equal 'You must select at least one module', flash[:error]
  end

  test 'should not register new user with invalid password' do
    assert_equal User.count , 2
    post registrations_url, params: { email: 'tester1@enet.com', password: "password", password_confirmation: "incorrect_password", modules: [university_modules(:one).id]}
    assert_equal User.count , 2
    # shows that the user was not created as the passwords did not match
  end
  end
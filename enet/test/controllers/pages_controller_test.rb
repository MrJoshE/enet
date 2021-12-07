require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get '/'
    assert_response :success

  end

  test "should get about" do
    get '/about'
    assert_response :success
  end

  test "should get contact" do
    get '/contact'
    assert_response :success
  end

  test 'should login' do

    user = users(:one)

    login user.email, 'password'
    assert_response :redirect

  end

  test 'should send the user to the dashboard if they are logged in' do

    user = User.first
    assert_not_nil user
    
    login user.email, 'password'
    get '/'
    assert_redirected_to '/dashboard'

  end
end

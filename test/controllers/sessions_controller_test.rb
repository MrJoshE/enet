require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test 'check the user can login and is stored in the session ' do
    user = users(:one)

    login(user.email, 'password')
    assert_equal user.id, session[:user_id]
  end

  test 'test logout' do
    user = users(:one)

    login(user.email, 'password')
    assert_equal user.id, session[:user_id]

    get '/sessions/logout'
    assert_nil session[:user_id]
  end


end
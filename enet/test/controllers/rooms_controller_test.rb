require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest

  setup do
    login(users(:one).email, "password")
  end

  test 'show index' do
    get rooms_url
    assert_response :success
  end


end

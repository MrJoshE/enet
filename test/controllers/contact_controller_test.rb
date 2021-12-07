require "test_helper"

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "should create" do
    post contact_create_url, params: {email: users(:one).email, name:"name", message: "test message"}
    assert_response :success
  end


  test "should get index" do
    get contact_path
    assert_response :success
  end
end

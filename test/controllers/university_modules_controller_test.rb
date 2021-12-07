require 'test_helper'

class UniversityModulesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @university_module = university_modules(:one)
    login(users(:one).email, 'password')
  end

  test "should get index" do
    get university_modules_url
    assert_response :success
  end

  test "should get new" do
    get new_university_module_url
    assert_response :success
  end

  test "should create university_module" do

    assert admin_check(User.find(session[:user_id])) == true
    @university_module = UniversityModule.new({name: @university_module.name,
                                               identifier: @university_module.identifier,
                                               module_leader: @university_module.module_leader})
    assert @university_module.save

  end

  test "should show university_module" do
    get university_module_url(@university_module)
    assert_response :success
  end

  test "should get edit" do
    get edit_university_module_url(@university_module)
    assert_response :success
  end

  test "should destroy university_module" do
    assert_difference('UniversityModule.count', -1) do
      delete university_module_url(@university_module)
    end

    assert_redirected_to university_modules_url
  end
end

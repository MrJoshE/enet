require 'test_helper'

class UniversityModulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @university_module = university_modules(:one)
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
    assert_difference('UniversityModule.count') do
      post university_modules_url, params: { university_module: { identifier: @university_module.identifier, module_leader: @university_module.module_leader, name: @university_module.name } }
    end

    assert_redirected_to university_module_url(UniversityModule.last)
  end

  test "should show university_module" do
    get university_module_url(@university_module)
    assert_response :success
  end

  test "should get edit" do
    get edit_university_module_url(@university_module)
    assert_response :success
  end

  test "should update university_module" do
    patch university_module_url(@university_module), params: { university_module: { identifier: @university_module.identifier, module_leader: @university_module.module_leader, name: @university_module.name } }
    assert_redirected_to university_module_url(@university_module)
  end

  test "should destroy university_module" do
    assert_difference('UniversityModule.count', -1) do
      delete university_module_url(@university_module)
    end

    assert_redirected_to university_modules_url
  end
end

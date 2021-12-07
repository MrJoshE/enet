require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  # test that when the user is not logged in, they are redirected to the unauthorized pag
  test 'should redirect to unauthorized page when not logged in' do
    get '/dashboard'
    assert_redirected_to '/unauthorized?url=http://www.example.com/dashboard'
  end

  test 'modules are loaded' do
    user = users(:one)
    login(user.email, 'password')
    module_ids = UserModule.where(user_id: user.id).pluck(:module_id)
    modules = UniversityModule.find(module_ids)
    assert_equal modules.count, 2
  end


end

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def login (email, password)
    post '/sessions/', params: { email: email, password: password}
  end

  def admin_check(user)
    assert user.is_admin?
  end


end

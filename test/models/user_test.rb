require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'create user' do
    user = User.new(email: users(:one),
                    password: 'password',
                    password_confirmation: 'password'
    )

    assert user.save!
  end

  test 'create user and destroy ' do
    user = User.new(email: users(:one),
                    password: 'password',
                    password_confirmation: 'password'
    )

    assert user.save!

    assert user.destroy

  end
end

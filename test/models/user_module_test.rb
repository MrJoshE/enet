require 'test_helper'

class UserModuleTest < ActiveSupport::TestCase
  test "create a user_module " do
    @module = UserModule.create({module_id: university_modules(:one).id, user_id: users(:one).id})

    assert @module.save

  end

  test "destroy a user module" do
    @module = UserModule.create({module_id: university_modules(:one).id, user_id: users(:one).id})
    @module.destroy

    assert @module.destroyed?
  end


end

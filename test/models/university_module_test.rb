require 'test_helper'

class UniversityModuleTest < ActiveSupport::TestCase
  test "create a university module" do
    university_module = UniversityModule.create(module_leader: 'Josh Everett', identifier: 'CS', name: "Josh's course")

    assert university_module.save
    assert_equal 'Josh Everett', university_module.module_leader
    assert_equal 'CS', university_module.identifier
    assert_equal "Josh's course", university_module.name
  end

  test 'can destroy university module' do
    assert_equal 3, UniversityModule.count
    university_module = UniversityModule.create(module_leader: 'Josh Everett', identifier: 'CS', name: "Josh's course")
    assert_equal 4, UniversityModule.count
    university_module.destroy

    assert_equal 3, UniversityModule.count
  end




end

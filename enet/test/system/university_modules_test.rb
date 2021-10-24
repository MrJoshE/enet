require "application_system_test_case"

class UniversityModulesTest < ApplicationSystemTestCase
  setup do
    @university_module = university_modules(:one)
  end

  test "visiting the index" do
    visit university_modules_url
    assert_selector "h1", text: "University Modules"
  end

  test "creating a University module" do
    visit university_modules_url
    click_on "New University Module"

    fill_in "Identifier", with: @university_module.identifier
    fill_in "Module leader", with: @university_module.module_leader
    fill_in "Name", with: @university_module.name
    click_on "Create University module"

    assert_text "University module was successfully created"
    click_on "Back"
  end

  test "updating a University module" do
    visit university_modules_url
    click_on "Edit", match: :first

    fill_in "Identifier", with: @university_module.identifier
    fill_in "Module leader", with: @university_module.module_leader
    fill_in "Name", with: @university_module.name
    click_on "Update University module"

    assert_text "University module was successfully updated"
    click_on "Back"
  end

  test "destroying a University module" do
    visit university_modules_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "University module was successfully destroyed"
  end
end

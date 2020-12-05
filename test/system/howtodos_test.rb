require "application_system_test_case"

class HowtodosTest < ApplicationSystemTestCase
  setup do
    @howtodo = howtodos(:one)
  end

  test "visiting the index" do
    visit howtodos_url
    assert_selector "h1", text: "Howtodos"
  end

  test "creating a Howtodo" do
    visit howtodos_url
    click_on "New Howtodo"

    fill_in "Description", with: @howtodo.description
    fill_in "Title", with: @howtodo.title
    click_on "Create Howtodo"

    assert_text "Howtodo was successfully created"
    click_on "Back"
  end

  test "updating a Howtodo" do
    visit howtodos_url
    click_on "Edit", match: :first

    fill_in "Description", with: @howtodo.description
    fill_in "Title", with: @howtodo.title
    click_on "Update Howtodo"

    assert_text "Howtodo was successfully updated"
    click_on "Back"
  end

  test "destroying a Howtodo" do
    visit howtodos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Howtodo was successfully destroyed"
  end
end

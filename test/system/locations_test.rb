require "application_system_test_case"

class LocationsTest < ApplicationSystemTestCase
  setup do
    @location = locations(:one)
  end

  test "visiting the index" do
    visit locations_url
    assert_selector "h1", text: "Locations"
  end

  test "should create location" do
    visit locations_url
    click_on "New location"

    fill_in "Address", with: @location.address
    fill_in "Contact", with: @location.contact
    fill_in "Description", with: @location.description
    fill_in "Image", with: @location.image
    fill_in "Location", with: @location.location_id
    fill_in "Name", with: @location.name
    fill_in "Open times", with: @location.open_times
    fill_in "Price", with: @location.price
    click_on "Create Location"

    assert_text "Location was successfully created"
    click_on "Back"
  end

  test "should update Location" do
    visit location_url(@location)
    click_on "Edit this location", match: :first

    fill_in "Address", with: @location.address
    fill_in "Contact", with: @location.contact
    fill_in "Description", with: @location.description
    fill_in "Image", with: @location.image
    fill_in "Location", with: @location.location_id
    fill_in "Name", with: @location.name
    fill_in "Open times", with: @location.open_times
    fill_in "Price", with: @location.price
    click_on "Update Location"

    assert_text "Location was successfully updated"
    click_on "Back"
  end

  test "should destroy Location" do
    visit location_url(@location)
    click_on "Destroy this location", match: :first

    assert_text "Location was successfully destroyed"
  end
end

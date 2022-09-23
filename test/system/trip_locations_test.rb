require "application_system_test_case"

class TripLocationsTest < ApplicationSystemTestCase
  setup do
    @trip_location = trip_locations(:one)
  end

  test "visiting the index" do
    visit trip_locations_url
    assert_selector "h1", text: "Trip locations"
  end

  test "should create trip location" do
    visit trip_locations_url
    click_on "New trip location"

    fill_in "Location", with: @trip_location.location_id
    fill_in "Trip", with: @trip_location.trip_id
    click_on "Create Trip location"

    assert_text "Trip location was successfully created"
    click_on "Back"
  end

  test "should update Trip location" do
    visit trip_location_url(@trip_location)
    click_on "Edit this trip location", match: :first

    fill_in "Location", with: @trip_location.location_id
    fill_in "Trip", with: @trip_location.trip_id
    click_on "Update Trip location"

    assert_text "Trip location was successfully updated"
    click_on "Back"
  end

  test "should destroy Trip location" do
    visit trip_location_url(@trip_location)
    click_on "Destroy this trip location", match: :first

    assert_text "Trip location was successfully destroyed"
  end
end

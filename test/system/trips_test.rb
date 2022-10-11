require "application_system_test_case"

class TripsTest < ApplicationSystemTestCase
  setup do
    @trip = trips(:one)
  end

  test "visiting the index" do
    visit trips_url
    assert_selector "h1", text: "Trips"
  end

  test "should create trip" do
    visit trips_url
    click_on "New trip"

    fill_in "Create by", with: @trip.create_by
    fill_in "Description", with: @trip.description
    check "Public" if @trip.public
    fill_in "Shares", with: @trip.shares
    fill_in "Title", with: @trip.title
    fill_in "Trip date", with: @trip.trip_date
    fill_in "Upvotes", with: @trip.upvotes
    click_on "Create Trip"

    assert_text "Trip was successfully created"
    click_on "Back"
  end

  test "should update Trip" do
    visit trip_url(@trip)
    click_on "Edit this trip", match: :first

    fill_in "Create by", with: @trip.create_by
    fill_in "Description", with: @trip.description
    check "Public" if @trip.public
    fill_in "Shares", with: @trip.shares
    fill_in "Title", with: @trip.title
    fill_in "Trip date", with: @trip.trip_date
    fill_in "Upvotes", with: @trip.upvotes
    click_on "Update Trip"

    assert_text "Trip was successfully updated"
    click_on "Back"
  end

  test "should destroy Trip" do
    visit trip_url(@trip)
    click_on "Destroy this trip", match: :first

    assert_text "Trip was successfully destroyed"
  end
end

require "application_system_test_case"

class TripUsersTest < ApplicationSystemTestCase
  setup do
    @trip_user = trip_users(:one)
  end

  test "visiting the index" do
    visit trip_users_url
    assert_selector "h1", text: "Trip users"
  end

  test "should create trip user" do
    visit trip_users_url
    click_on "New trip user"

    fill_in "Trip", with: @trip_user.trip_id
    fill_in "User", with: @trip_user.user_id
    click_on "Create Trip user"

    assert_text "Trip user was successfully created"
    click_on "Back"
  end

  test "should update Trip user" do
    visit trip_user_url(@trip_user)
    click_on "Edit this trip user", match: :first

    fill_in "Trip", with: @trip_user.trip_id
    fill_in "User", with: @trip_user.user_id
    click_on "Update Trip user"

    assert_text "Trip user was successfully updated"
    click_on "Back"
  end

  test "should destroy Trip user" do
    visit trip_user_url(@trip_user)
    click_on "Destroy this trip user", match: :first

    assert_text "Trip user was successfully destroyed"
  end
end

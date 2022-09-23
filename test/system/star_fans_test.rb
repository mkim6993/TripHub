require "application_system_test_case"

class StarFansTest < ApplicationSystemTestCase
  setup do
    @star_fan = star_fans(:one)
  end

  test "visiting the index" do
    visit star_fans_url
    assert_selector "h1", text: "Star fans"
  end

  test "should create star fan" do
    visit star_fans_url
    click_on "New star fan"

    fill_in "Fan", with: @star_fan.fan_id
    fill_in "Star", with: @star_fan.star_id
    click_on "Create Star fan"

    assert_text "Star fan was successfully created"
    click_on "Back"
  end

  test "should update Star fan" do
    visit star_fan_url(@star_fan)
    click_on "Edit this star fan", match: :first

    fill_in "Fan", with: @star_fan.fan_id
    fill_in "Star", with: @star_fan.star_id
    click_on "Update Star fan"

    assert_text "Star fan was successfully updated"
    click_on "Back"
  end

  test "should destroy Star fan" do
    visit star_fan_url(@star_fan)
    click_on "Destroy this star fan", match: :first

    assert_text "Star fan was successfully destroyed"
  end
end

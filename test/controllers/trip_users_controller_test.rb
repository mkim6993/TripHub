require "test_helper"

class TripUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip_user = trip_users(:one)
  end

  test "should get index" do
    get trip_users_url
    assert_response :success
  end

  test "should get new" do
    get new_trip_user_url
    assert_response :success
  end

  test "should create trip_user" do
    assert_difference("TripUser.count") do
      post trip_users_url, params: { trip_user: { trip_id: @trip_user.trip_id, user_id: @trip_user.user_id } }
    end

    assert_redirected_to trip_user_url(TripUser.last)
  end

  test "should show trip_user" do
    get trip_user_url(@trip_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_user_url(@trip_user)
    assert_response :success
  end

  test "should update trip_user" do
    patch trip_user_url(@trip_user), params: { trip_user: { trip_id: @trip_user.trip_id, user_id: @trip_user.user_id } }
    assert_redirected_to trip_user_url(@trip_user)
  end

  test "should destroy trip_user" do
    assert_difference("TripUser.count", -1) do
      delete trip_user_url(@trip_user)
    end

    assert_redirected_to trip_users_url
  end
end

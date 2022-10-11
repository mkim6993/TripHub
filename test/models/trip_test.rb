require "test_helper"

class TripTest < ActiveSupport::TestCase
  def setup
    @trip = Trip.new(create_by: "Example User", trip_date: 10-10-10, title: "Example title", description: "this is an example description", upvotes: 10, shares: 30, public: true)
  end

  test "should be valid" do
    assert @trip.valid?
  end

  test "create_by should be present" do
    @trip.create_by = ""
    assert_not @trip.valid?
  end

  test "title should be present" do
    @trip.title = ""
    assert_not @trip.valid?
  end

  test "trip_date should be present" do
    @trip.trip_date = nil
    assert_not @trip.valid?
  end

  test "description should be present" do
    @trip.description = ""
    assert_not @trip.valid?
  end

  test "upvotes should be present" do
    @trip.upvotes = nil
    assert_not @trip.valid?
  end

  test "shares should be present" do
    @trip.shares = nil
    assert_not @trip.valid?
  end

  test "public should be present" do
    @trip.public = nil
    assert_not @trip.valid?
  end

  test "create_by should not be too long" do
    @trip.create_by = "a" * 51
    assert_not @trip.valid?
  end

  test "title should not be too long" do
    @trip.title = "a" * 51
    assert_not @trip.valid?
  end

  test "description should not be too long" do
    @trip.description = "a" * 501
    assert_not @trip.valid?
  end
end

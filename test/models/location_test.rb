require "test_helper"

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = Location.new(name: "Example Location", address: "Example Address", contact: "Example Contact", description: "this is an example description", price: 10, image: "Example URL", open_times: "M:1-3, T:3-5")
  end

  test "should be valid" do
    assert @location.valid?
  end

  test "name should be present" do
    @location.name = ""
    assert_not @location.valid?
  end

  test "address should be present" do
    @location.address = ""
    assert_not @location.valid?
  end

  test "contact should be present" do
    @location.contact = ""
    assert_not @location.valid?
  end

  test "description should be present" do
    @location.description = ""
    assert_not @location.valid?
  end

  test "price should be present" do
    @location.price = nil
    assert_not @location.valid?
  end

  test "image should be present" do
    @location.image = ""
    assert_not @location.valid?
  end

  test "open_times should be present" do
    @location.open_times = ""
    assert_not @location.valid?
  end

  test "name should not be too long" do
    @location.name = "a" * 51
    assert_not @location.valid?
  end

  test "address should not be too long" do
    @location.address = "a" * 101
    assert_not @location.valid?
  end

  test "description should not be too long" do
    @location.description = "a" * 501
    assert_not @location.valid?
  end

  test "contact should not be too long" do
    @location.contact = "a" * 101
    assert_not @location.valid?
  end

  test "image should not be too long" do
    @location.image = "a" * 256
    assert_not @location.valid?
  end

  test "open_times should not be too long" do
    @location.open_times = "a" * 101
    assert_not @location.valid?
  end
end

require "test_helper"

class PlacesControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get places_list_url
    assert_response :success
  end
end

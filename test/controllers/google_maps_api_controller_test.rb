require "test_helper"

class GoogleMapsApiControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get google_maps_api_show_url
    assert_response :success
  end
end

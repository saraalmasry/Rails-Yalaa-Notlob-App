require 'test_helper'

class FriendShipControllerTest < ActionDispatch::IntegrationTest
  test "should get addFriends" do
    get friend_ship_addFriends_url
    assert_response :success
  end

end

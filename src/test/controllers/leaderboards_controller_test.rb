require 'test_helper'

class LeaderboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get leaderboards_new_url
    assert_response :success
  end

end

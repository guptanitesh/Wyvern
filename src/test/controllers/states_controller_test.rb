require 'test_helper'

class StatesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get states_new_url
    assert_response :success
  end

end

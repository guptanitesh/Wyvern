require 'test_helper'

class QuizzsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get quizzs_new_url
    assert_response :success
  end

end

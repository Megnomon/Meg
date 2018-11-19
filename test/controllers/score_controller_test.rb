require 'test_helper'

class ScoreControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get score_main_url
    assert_response :success
  end

end

require 'test_helper'

class PBassControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get p_bass_new_url
    assert_response :success
  end

end

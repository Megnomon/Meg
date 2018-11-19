require 'test_helper'

class MusicControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get music_main_url
    assert_response :success
  end

end

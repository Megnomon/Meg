require 'test_helper'

class DkeyboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dkeyboards_new_url
    assert_response :success
  end

end

require 'test_helper'

class PkeyboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pkeyboards_new_url
    assert_response :success
  end

end

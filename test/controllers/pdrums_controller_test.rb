require 'test_helper'

class PdrumsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pdrums_new_url
    assert_response :success
  end

end

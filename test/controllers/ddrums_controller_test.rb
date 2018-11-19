require 'test_helper'

class DdrumsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get ddrums_new_url
    assert_response :success
  end

end

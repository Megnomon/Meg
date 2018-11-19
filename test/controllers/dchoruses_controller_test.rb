require 'test_helper'

class DchorusesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dchoruses_new_url
    assert_response :success
  end

end

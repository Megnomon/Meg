require 'test_helper'

class DictationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dictations_new_url
    assert_response :success
  end

end

require 'test_helper'

class DbassesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dbasses_new_url
    assert_response :success
  end

end

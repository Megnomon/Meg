require 'test_helper'

class AcountControllerTest < ActionDispatch::IntegrationTest
  test "should get mypage" do
    get acount_mypage_url
    assert_response :success
  end

end

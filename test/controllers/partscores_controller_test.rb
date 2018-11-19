require 'test_helper'

class PartscoresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get partscores_new_url
    assert_response :success
  end

end

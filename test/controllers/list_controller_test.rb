require 'test_helper'

class ListControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get list_new_url
    assert_response :success
  end

end

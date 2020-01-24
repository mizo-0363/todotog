require 'test_helper'

class GrouplistControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get grouplist_new_url
    assert_response :success
  end

  test "should get edit" do
    get grouplist_edit_url
    assert_response :success
  end

end

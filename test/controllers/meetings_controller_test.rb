require 'test_helper'

class MeetingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get meetings_new_url
    assert_response :success
  end

  test "should get show" do
    get meetings_show_url
    assert_response :success
  end

  test "should get update" do
    get meetings_update_url
    assert_response :success
  end

  test "should get destroy" do
    get meetings_destroy_url
    assert_response :success
  end

end

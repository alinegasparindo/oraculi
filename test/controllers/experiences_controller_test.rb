require 'test_helper'

class ExperiencesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get experiences_new_url
    assert_response :success
  end

  test "should get update" do
    get experiences_update_url
    assert_response :success
  end

  test "should get destroy" do
    get experiences_destroy_url
    assert_response :success
  end

  test "should get index" do
    get experiences_index_url
    assert_response :success
  end

end

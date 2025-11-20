require "test_helper"

class StoryProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get story_profiles_new_url
    assert_response :success
  end

  test "should get create" do
    get story_profiles_create_url
    assert_response :success
  end

  test "should get edit" do
    get story_profiles_edit_url
    assert_response :success
  end

  test "should get update" do
    get story_profiles_update_url
    assert_response :success
  end
end

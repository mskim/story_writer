require "test_helper"

class StorySectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get story_sections_new_url
    assert_response :success
  end

  test "should get create" do
    get story_sections_create_url
    assert_response :success
  end

  test "should get edit" do
    get story_sections_edit_url
    assert_response :success
  end

  test "should get update" do
    get story_sections_update_url
    assert_response :success
  end

  test "should get destroy" do
    get story_sections_destroy_url
    assert_response :success
  end
end

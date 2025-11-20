require "test_helper"

class ChaptersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @story = stories(:one)
    @chapter = chapters(:one)
    sign_in_as(@user)
  end

  test "should get index" do
    get story_chapters_url(@story)
    assert_response :success
  end

  test "should get new" do
    get new_story_chapter_url(@story)
    assert_response :success
  end

  test "should create chapter" do
    assert_difference("Chapter.count") do
      post story_chapters_url(@story), params: { chapter: {
        title: "New Chapter",
        description: "Description",
        chapter_number: 3,
        sort_order: 3,
        life_phase_id: life_phases(:family_heritage).id
      } }
    end

    assert_redirected_to story_chapter_url(@story, Chapter.last)
  end

  test "should get edit" do
    get edit_story_chapter_url(@story, @chapter)
    assert_response :success
  end

  test "should update chapter" do
    patch story_chapter_url(@story, @chapter), params: { chapter: { title: "Updated Title" } }
    assert_redirected_to story_chapter_url(@story, @chapter)

    @chapter.reload
    assert_equal "Updated Title", @chapter.title
  end

  test "should destroy chapter" do
    assert_difference("Chapter.count", -1) do
      delete story_chapter_url(@story, @chapter)
    end

    assert_redirected_to story_url(@story)
  end
end

require "test_helper"

class StoryProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @story = stories(:one)
    sign_in_as(@user)
  end

  test "should get new" do
    get new_story_profile_url(@story)
    assert_response :success
  end

  test "should create profile" do
    # Create a new story without a profile for this test
    story = Story.create!(
      title: "New Story",
      user: @user,
      account: @user.account
    )

    assert_difference("StoryProfile.count") do
      post story_profile_url(story), params: { story_profile: {
        full_name: "John Doe",
        birth_year: 1980,
        current_age: 45,
        gender: "Male",
        birthplace: "New York",
        education_level: "college",
        primary_occupation: "Engineer"
      } }
    end

    assert_redirected_to story_url(story)
    assert_equal "Profile saved successfully! 9 chapters have been automatically generated for your story.", flash[:notice]
  end

  test "should get edit" do
    # stories(:one) already has a profile from fixtures
    get edit_story_profile_url(@story)
    assert_response :success
  end

  test "should update profile" do
    # stories(:one) already has a profile from fixtures
    profile = @story.story_profile

    patch story_profile_url(@story), params: { story_profile: { full_name: "Jane Doe" } }
    assert_redirected_to story_url(@story)

    profile.reload
    assert_equal "Jane Doe", profile.full_name
  end
end

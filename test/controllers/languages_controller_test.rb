require "test_helper"

class LanguagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in_as(@user)
  end

  test "should update language to korean" do
    patch update_language_url, params: { language: "ko" }
    assert_redirected_to dashboard_path

    @user.reload
    assert_equal "ko", @user.language
    assert_equal :ko, I18n.locale
  end

  test "should update language to english" do
    patch update_language_url, params: { language: "en" }
    assert_redirected_to dashboard_path

    @user.reload
    assert_equal "en", @user.language
    assert_equal :en, I18n.locale
  end

  test "should not update with invalid language" do
    patch update_language_url, params: { language: "fr" }
    assert_redirected_to dashboard_path
    assert_equal "Invalid language", flash[:alert]

    @user.reload
    assert_nil @user.language # Assuming it was nil initially or check against previous value
  end
end

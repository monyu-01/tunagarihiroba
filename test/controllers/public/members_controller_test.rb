require "test_helper"

class Public::MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_members_show_url
    assert_response :success
  end

  test "should get dashboard" do
    get public_members_dashboard_url
    assert_response :success
  end

  test "should get edit_profile" do
    get public_members_edit_profile_url
    assert_response :success
  end

  test "should get saved_posts" do
    get public_members_saved_posts_url
    assert_response :success
  end

  test "should get followers" do
    get public_members_followers_url
    assert_response :success
  end

  test "should get followings" do
    get public_members_followings_url
    assert_response :success
  end

  test "should get edit_information" do
    get public_members_edit_information_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get public_members_unsubscribe_url
    assert_response :success
  end
end

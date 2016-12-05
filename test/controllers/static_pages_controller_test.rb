require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get teachers" do
    get static_pages_teachers_url
    assert_response :success
  end

  test "should get schedule" do
    get static_pages_schedule_url
    assert_response :success
  end

  test "should get classes" do
    get static_pages_classes_url
    assert_response :success
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
  end

end

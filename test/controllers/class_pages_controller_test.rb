require 'test_helper'

class ClassPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_page = class_pages(:one)
  end

  test "should get index" do
    get class_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_class_page_url
    assert_response :success
  end

  test "should create class_page" do
    assert_difference('ClassPage.count') do
      post class_pages_url, params: { class_page: { class_content: @class_page.class_content, class_title: @class_page.class_title, order_position: @class_page.order_position } }
    end

    assert_redirected_to class_page_url(ClassPage.last)
  end

  test "should show class_page" do
    get class_page_url(@class_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_page_url(@class_page)
    assert_response :success
  end

  test "should update class_page" do
    patch class_page_url(@class_page), params: { class_page: { class_content: @class_page.class_content, class_title: @class_page.class_title, order_position: @class_page.order_position } }
    assert_redirected_to class_page_url(@class_page)
  end

  test "should destroy class_page" do
    assert_difference('ClassPage.count', -1) do
      delete class_page_url(@class_page)
    end

    assert_redirected_to class_pages_url
  end
end

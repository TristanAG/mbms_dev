require 'test_helper'

class BasicPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @basic_page = basic_pages(:one)
  end

  test "should get index" do
    get basic_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_basic_page_url
    assert_response :success
  end

  test "should create basic_page" do
    assert_difference('BasicPage.count') do
      post basic_pages_url, params: { basic_page: { page_content: @basic_page.page_content } }
    end

    assert_redirected_to basic_page_url(BasicPage.last)
  end

  test "should show basic_page" do
    get basic_page_url(@basic_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_basic_page_url(@basic_page)
    assert_response :success
  end

  test "should update basic_page" do
    patch basic_page_url(@basic_page), params: { basic_page: { page_content: @basic_page.page_content } }
    assert_redirected_to basic_page_url(@basic_page)
  end

  test "should destroy basic_page" do
    assert_difference('BasicPage.count', -1) do
      delete basic_page_url(@basic_page)
    end

    assert_redirected_to basic_pages_url
  end
end

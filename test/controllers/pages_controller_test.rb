require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get pages_welcome_url
    assert_response :success
  end

  test "should get feed" do
    get pages_feed_url
    assert_response :success
  end

  test "should get message" do
    get pages_message_url
    assert_response :success
  end

end

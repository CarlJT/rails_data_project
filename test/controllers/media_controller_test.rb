require 'test_helper'

class MediaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get media_index_url
    assert_response :success
  end

  test "should get show" do
    get media_show_url
    assert_response :success
  end

end

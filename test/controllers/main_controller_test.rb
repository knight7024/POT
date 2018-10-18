require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get posts" do
    get main_posts_url
    assert_response :success
  end

end

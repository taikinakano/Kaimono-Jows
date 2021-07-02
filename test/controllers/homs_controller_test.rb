require 'test_helper'

class HomsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get homs_top_url
    assert_response :success
  end

  test "should get about" do
    get homs_about_url
    assert_response :success
  end

end

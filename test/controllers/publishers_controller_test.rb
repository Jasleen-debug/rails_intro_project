require "test_helper"

class PublishersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publishers_index_url
    assert_response :success
  end

  test "should get show" do
    get publishers_show_url
    assert_response :success
  end
end

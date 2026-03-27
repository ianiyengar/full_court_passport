require "test_helper"

class ArenasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get arenas_index_url
    assert_response :success
  end

  test "should get show" do
    get arenas_show_url
    assert_response :success
  end
end

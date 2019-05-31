require 'test_helper'

class PostsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get posts_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get posts_controller_create_url
    assert_response :success
  end

  test "should get index" do
    get posts_controller_index_url
    assert_response :success
  end

end

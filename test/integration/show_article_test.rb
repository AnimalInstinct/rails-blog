require "test_helper"

class ShowArticleTest < ActionDispatch::IntegrationTest
  test "get_article" do
    get "/articles"
    assert_response :success
  end
end

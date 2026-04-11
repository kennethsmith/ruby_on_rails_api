require "test_helper"

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  test "should get not_found" do
    get errors_not_found_url
    assert_response :not_found
    assert_equal 'Not Found', JSON.parse(@response.body)["error"]
  end

  test "should get internal_server_error" do
    get errors_internal_server_error_url
    assert_response :internal_server_error
    assert_equal 'Internal Server Error', JSON.parse(@response.body)["error"]
  end
end
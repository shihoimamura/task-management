require "test_helper"

class TaskControllerTest < ActionDispatch::IntegrationTest
  test "should get management" do
    get task_management_url
    assert_response :success
  end

  test "should get index" do
    get task_index_url
    assert_response :success
  end
end

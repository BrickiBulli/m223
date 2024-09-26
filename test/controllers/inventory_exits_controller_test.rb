require "test_helper"

class InventoryExitsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get inventory_exits_new_url
    assert_response :success
  end

  test "should get create" do
    get inventory_exits_create_url
    assert_response :success
  end
end

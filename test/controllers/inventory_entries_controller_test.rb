require "test_helper"

class InventoryEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get inventory_entries_new_url
    assert_response :success
  end

  test "should get create" do
    get inventory_entries_create_url
    assert_response :success
  end
end

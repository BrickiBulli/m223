require 'test_helper'

class InventoryEntryTest < ActiveSupport::TestCase
  def setup
    @article = Article.create!(
      name: "Sample Article",
      article_number: "A123",
      weight: 10.5
    )
    @employee = Employee.create!(
      first_name: "John",
      last_name: "Doe",
      address: "123 Main St",
      city: "Anytown",
      postal_code: "12345",
      email: "john.doe@example.com",
      role: Employee::ROLE_STORAGE_MANAGER,
      password: "securepassword123"
    )
    @inventory_entry = InventoryEntry.new(
      article: @article,
      employee: @employee,
      quantity: 100,
      entry_date: Date.today
    )
  end

  test "should be valid with valid attributes" do
    assert @inventory_entry.valid?
  end

  test "should be invalid without an article" do
    @inventory_entry.article = nil
    assert_not @inventory_entry.valid?
  end

  test "should be invalid without an employee" do
    @inventory_entry.employee = nil
    assert_not @inventory_entry.valid?
  end

  test "should be invalid without a quantity" do
    @inventory_entry.quantity = nil
    assert_not @inventory_entry.valid?
  end

  test "should be invalid with a non-numerical quantity" do
    @inventory_entry.quantity = "not_a_number"
    assert_not @inventory_entry.valid?
  end

  test "should be invalid with a quantity less than or equal to zero" do
    @inventory_entry.quantity = 0
    assert_not @inventory_entry.valid?
    @inventory_entry.quantity = -1
    assert_not @inventory_entry.valid?
  end

  test "should be invalid without an entry_date" do
    @inventory_entry.entry_date = nil
    assert_not @inventory_entry.valid?
  end
end

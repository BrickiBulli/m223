require 'test_helper'

class InventoryExitTest < ActiveSupport::TestCase
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
    @inventory_exit = InventoryExit.new(
      article: @article,
      employee: @employee,
      quantity: 30,
      exit_date: Date.today
    )
  end

  test "should be valid with valid attributes" do
    assert @inventory_exit.valid?
  end

  test "should be invalid without an article" do
    @inventory_exit.article = nil
    assert_not @inventory_exit.valid?
  end

  test "should be invalid without an employee" do
    @inventory_exit.employee = nil
    assert_not @inventory_exit.valid?
  end

  test "should be invalid without a quantity" do
    @inventory_exit.quantity = nil
    assert_not @inventory_exit.valid?
  end

  test "should be invalid with a non-numerical quantity" do
    @inventory_exit.quantity = "not_a_number"
    assert_not @inventory_exit.valid?
  end

  test "should be invalid with a quantity less than or equal to zero" do
    @inventory_exit.quantity = 0
    assert_not @inventory_exit.valid?
    @inventory_exit.quantity = -1
    assert_not @inventory_exit.valid?
  end

  test "should be invalid without an exit_date" do
    @inventory_exit.exit_date = nil
    assert_not @inventory_exit.valid?
  end
end

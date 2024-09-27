require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  def setup
    @employee = Employee.new(
      first_name: "John",
      last_name: "Doe",
      address: "123 Main St",
      city: "Anytown",
      postal_code: "12345",
      email: "john.doe@example.com",
      role: Employee::ROLE_STORAGE_MANAGER,
      password: "securepassword123"
    )
  end

  test "should be valid with valid attributes" do
    assert @employee.valid?
  end

  test "should be invalid without a first name" do
    @employee.first_name = nil
    assert_not @employee.valid?
  end

  test "should be invalid without a last name" do
    @employee.last_name = nil
    assert_not @employee.valid?
  end

  test "should be invalid without an address" do
    @employee.address = nil
    assert_not @employee.valid?
  end

  test "should be invalid without a city" do
    @employee.city = nil
    assert_not @employee.valid?
  end

  test "should be invalid without a postal code" do
    @employee.postal_code = nil
    assert_not @employee.valid?
  end

  test "should be invalid without an email" do
    @employee.email = nil
    assert_not @employee.valid?
  end

  test "should be invalid with a duplicate email" do
    duplicate_employee = @employee.dup
    @employee.save
    assert_not duplicate_employee.valid?
  end

  test "should be invalid with an invalid email format" do
    @employee.email = "invalid_email"
    assert_not @employee.valid?
  end

  test "should be invalid without a role" do
    @employee.role = nil
    assert_not @employee.valid?
  end

  test "should be invalid with an invalid role" do
    @employee.role = "InvalidRole"
    assert_not @employee.valid?
  end

  test "should be invalid without a password on create" do
    @employee.password = nil
    assert_not @employee.valid?(:create)
  end

  test "should be invalid with a short password on create" do
    @employee.password = "short"
    assert_not @employee.valid?(:create)
  end

  test "should be valid with a blank password on update" do
    @employee.save
    @employee.password = ""
    assert @employee.valid?(:update)
  end

  test "should be invalid with a short password on update" do
    @employee.save
    @employee.password = "short"
    assert_not @employee.valid?(:update)
  end

  test "should return true if the role is StorageManager" do
    assert @employee.storage_manager?
  end

  test "should return false if the role is not StorageManager" do
    @employee.role = Employee::ROLE_STORAGE_WORKER
    assert_not @employee.storage_manager?
  end

  test "should return true if the role is StorageWorker" do
    @employee.role = Employee::ROLE_STORAGE_WORKER
    assert @employee.storage_worker?
  end

  test "should return false if the role is not StorageWorker" do
    assert_not @employee.storage_worker?
  end
end

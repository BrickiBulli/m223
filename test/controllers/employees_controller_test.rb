require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
    @valid_employee_params = {
      first_name: "John",
      last_name: "Doe",
      address: "123 Main St",
      city: "Anytown",
      postal_code: "12345",
      email: "john.doe@example.com",
      role: Employee::ROLE_STORAGE_MANAGER,
      password: "securepassword123"
    }
    @invalid_employee_params = {
      first_name: "",
      last_name: "",
      address: "",
      city: "",
      postal_code: "",
      email: "invalid_email",
      role: "",
      password: ""
    }
    # Manually set the session
    @storage_manager = employees(:storage_manager)
    log_in_as(@storage_manager)
  end

  test "should get index" do
    get employees_url
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should get new" do
    get new_employee_url
    assert_response :success
    assert_not_nil assigns(:employee)
  end

  test "should create employee with valid params" do
    assert_difference('Employee.count') do
      post employees_url, params: { employee: @valid_employee_params }
    end
    assert_redirected_to employee_url(Employee.last)
    assert_equal 'Employee was successfully created.', flash[:notice]
  end

  test "should not create employee with invalid params" do
    assert_no_difference('Employee.count') do
      post employees_url, params: { employee: @invalid_employee_params }
    end
    assert_response :unprocessable_entity
    assert_template :new
  end

  private

  def log_in_as(employee)
    post login_url, params: { email: employee.email, password: 'password' }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
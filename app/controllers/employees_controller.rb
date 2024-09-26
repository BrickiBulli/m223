class EmployeesController < ApplicationController
  before_action :require_login
  before_action :check_storage_manager, only: [:new, :create, :index]
  before_action :check_currentemploye_show_employe, only: [:show, :edit]


  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    
    if @employee.save
      redirect_to @employee, notice: "Employee was successfully created."
    else
      render :new, status: 422
    end
  end

  def show
    @employee = Employee.find(params[:id])

    unless @employee
      redirect_to employees_path, alert: "Employee not found."
    end
  end

  def update
    @employee = Employee.find(params[:id])
    
    if @employee.update(employee_params)
      if @employee.saved_change_to_email?
        url = "#{request.base_url}#{log_email_path}"
        email_to_log = @employee.email
        RestClient.post(url, { email: email_to_log })
      end 

      redirect_to @employee, notice: "Employee was successfully updated."
    else
      console
      render :edit  
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path, notice: "Employee was successfully deleted."
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :address, :city, :postal_code, :email, :password, :password_confirmation, :role)
  end

 
  def check_storage_manager
    unless @current_employee&.storage_manager?
      redirect_to root_path, alert: "You are not authorized to create an employee."
    end
  end

  def check_currentemploye_show_employe
    unless @current_employee&.storage_manager? || @current_employee.id == Employee.find(params[:id]).id
      redirect_to root_path, alert: "You are not authorized to create an employee."
    end 
  end

end

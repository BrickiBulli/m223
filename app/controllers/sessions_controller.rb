class SessionsController < ApplicationController
  def new
  end

  def create
    employee = Employee.authenticate_by(email: params[:email], password: params[:password]) 
    if employee
      session[:employee_id] = employee.id
      redirect_to articles_path, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid email or password.'
      render :new
    end
  end

  def destroy
    session.delete(:employee_id)
    redirect_to login_path, notice: 'Logged out successfully.'
  end
end
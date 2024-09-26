class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  helper_method :current_employee, :logged_in?

  def current_employee
    @current_employee ||= Employee.find_by(id: session[:employee_id])
  end

  def logged_in?
    !!current_employee
  end

  def require_login
    unless logged_in?
      flash[:alert] = 'You must be logged in to access this section'
      redirect_to login_path
    end
  end
end
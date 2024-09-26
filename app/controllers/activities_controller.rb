class ActivitiesController < ApplicationController
  before_action :require_login
  before_action :check_storage_manager, only: [:index]

  def index
    @versions = PaperTrail::Version.all.order(created_at: :desc)  # Get all versions ordered by created_at
  end

  private

  def check_storage_manager
    unless @current_employee&.storage_manager?
      redirect_to root_path, alert: "You are not authorized to create an employee."
    end
  end
end

class ActivitiesController < ApplicationController
  def index
    @versions = PaperTrail::Version.all.order(created_at: :desc)  # Get all versions ordered by created_at
  end
end

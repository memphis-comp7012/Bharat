class DashboardController < ApplicationController
  helper_method :get_counts_of_projects

  # GET /dashboard
  def index
    @points_earned = Contribution.where("score > ? and user_id == ?", 0, current_user.id).sum('score')
    @points_lost = Contribution.where("score < ? and user_id == ?", 0, current_user.id).sum('score')
    @money_received = Contribution.where("score > ? and user_id == ?", 0, current_user.id).sum('money_received')

  end

  # Counter Helper
  def get_counts_of_projects(status)
    return Project.where('status == ? AND user_id == ?', Project.statuses[status], current_user.id).count
  end

end

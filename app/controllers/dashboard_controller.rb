class DashboardController < ApplicationController
  helper_method :get_counts_of_projects, :get_counts_of_tasks, :get_counts_of_requests

  # GET /dashboard
  def index
    @points_earned = Contribution.where("score > ? and user_id == ?", 0, current_user.id).sum('score')
    @points_lost = Contribution.where("score < ? and user_id == ?", 0, current_user.id).sum('score')
    @money_received = Contribution.where("score > ? and user_id == ?", 0, current_user.id).sum('money_received')
  end

  # Counter Helper
  def get_counts_of_projects(status)
    @projects_created = Project.where('user_id == ?', current_user.id)
    @projects_created = @projects_created.status(Project.statuses[status])

    @projects_collaborated = Team.where('user_id == ?', current_user.id).pluck(:project_id)
    @projects_collaborated = Project.where(:id => @projects_collaborated)
    @projects_collaborated = @projects_collaborated.status(Project.statuses[status])

    return (@projects_created + @projects_collaborated).uniq.count
  end

  def get_counts_of_tasks(status)
    return Task.where('status == ? AND user_id == ?', Task.statuses[status], current_user.id).count
  end

  def get_counts_of_requests(status)
    @my_requests = Request.where("user_id = ? and status = ?", current_user.id, Request.request_statuses[status])
    @founding_member_projects = Project.where('user_id = ?', current_user.id).pluck('id')
    @founding_member_requests = Request.where("project_id in (?) and user_id != ? and status = ?", @founding_member_projects, current_user.id, Request.request_statuses[status])
    return (@my_requests + @founding_member_requests).length
  end
end

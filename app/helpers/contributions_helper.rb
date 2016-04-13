module ContributionsHelper

  def get_positive_contribution(project_id, user_id)
    return Contribution.where('project_id == ? AND user_id == ? AND score > ? AND money_received > ?', project_id, user_id, 0, 0).first
  end

end

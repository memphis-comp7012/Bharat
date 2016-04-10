# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#  user_id    :integer
#


class Team < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
end

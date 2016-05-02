# == Schema Information
#
# Table name: requests
#
#  id         :integer          not null, primary key
#  type       :integer
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  project_id :integer
#

class Request < ActiveRecord::Base
  enum request_type: [:join, :leave]
  enum request_status: [:unapproved, :approved, :rejected]

  validates :type,
            presence: true,
            inclusion: {
                in: Request.request_types.values,
                message: "must be either " + request_types.keys.join(" or ")
            }
  validates :status,
            presence: true,
            inclusion: {
                in: Request.request_statuses.values,
                message: "must be either " + request_statuses.keys.join(" or ")
            }

  private
  # to avoid the default ruby issue with type
  def self.inheritance_column
    nil
  end
end

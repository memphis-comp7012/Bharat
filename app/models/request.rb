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
end

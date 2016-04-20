class Task < ActiveRecord::Base
  enum task_status: [:not_started, :in_progress, :on_hold, :complete]

  validates :name,
            length: {maximum: 225},
            presence: true

  validates :description,
            presence: true,
            length: {maximum: 3000}

  validates :status,
            presence: true,
            inclusion: {
                in: task_statuses.keys,
                message: "must be either " + task_statuses.keys.join(" or ")
            }

  validates :assigned_user,
            presence: true,
            numericality: {
                only_integer: true,
                greater_than_or_equal_to: 0
            }

  validates :due_date,
            date: {after_or_equal_to: Proc.new { Time.now-1.day }},
            presence: true

  belongs_to :user
end

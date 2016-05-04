# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :string
#  status        :integer
#  assigned_user :integer
#  due_date      :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#

class Task < ActiveRecord::Base
  enum status: [:not_started, :in_progress, :on_hold, :complete]

  validates :name,
            length: {maximum: 225},
            presence: true

  validates :description,
            presence: true,
            length: {maximum: 3000}

  validates :status,
            presence: true,
            inclusion: {
                in: Task.statuses.keys,
                message: "must be either " + Task.statuses.keys.join(" or ")
            }

  validates :assigned_user,
            presence: true,
            numericality: {
                only_integer: true,
                greater_than_or_equal_to: 0
            }

  validates :due_date,
            presence: true,
            date: {after_or_equal_to: Proc.new { Time.now-1.day }}


  belongs_to :user
  belongs_to :iteration
end

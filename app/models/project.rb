# == Schema Information
#
# Table name: projects
#
#  id               :integer          not null, primary key
#  name             :string
#  status           :integer
#  description      :string
#  start_date       :date
#  end_date         :date
#  funding          :decimal(10, 2)
#  difficulty_level :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  department_id    :integer
#  user_id          :integer
#




class Project < ActiveRecord::Base
  enum status: [:not_started, :in_progress, :on_hold, :complete]
  enum difficulty_level: [:easy, :medium, :hard]
  
  validates :name,
            length: { maximum: 225 },
            presence: true
  validates :status,
            presence: true,
            inclusion: {
              in: statuses.keys,
              message: "must be either " + statuses.keys.join(" or ")
            }
  validates :description,
            presence: true,
            length: { maximum: 3000 }
  validates :start_date,
            date: { after_or_equal_to: Proc.new { Time.now - 1.day}},
            presence: true
  validates :end_date,
            date: { after: :start_date},
            presence: true
  validates :funding,
            numericality: { greater_than_or_equal_to: 0},
            presence: true
  validates :difficulty_level,
            presence: true,
            inclusion: {
              in: difficulty_levels.keys,
              message: "must be either " + difficulty_levels.keys.join(" or ")
            }


  belongs_to :department
  belongs_to :user
  has_many :project_research_fields
  has_one :contribution
  has_many :teams
end

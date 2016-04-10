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
  validates :name,
            length: { maximum: 225 },
            presence: true
  validates :status,
            numericality: { only_interger: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 4},
            presence: true
  validates :description,
            presence: true,
            length: { maximum: 3000 }
  validates :start_date,
            date: { after: Proc.new {Time.now}, before: Proc.new {Time.now}},
            presence: true
  validates :end_date,
            date: { after: :start_date, before: Proc.new {Time.now}},
            presence: true
  validates :funding,
            numericality: { greater_than_or_equal_to: 0},
            presence: true
  validates :difficulty_level,
            numericality: { only_interger: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 2},
            presence: true

  belongs_to :department
  belongs_to :user
  has_many :project_research_fields
  has_one :contribution
  has_many :team
end

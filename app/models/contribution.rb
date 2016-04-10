# == Schema Information
#
# Table name: contributions
#
#  id             :integer          not null, primary key
#  score          :integer
#  money_received :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#  project_id     :integer
#


class Contribution < ActiveRecord::Base
  validates :score,
            presence: true,
            numericality: {
                only_integer: true,
                greater_than_or_equal_to: -100,
                less_than_or_equal_to: 10000
            }

  validates :money_received,
            presence: true,
            numericality: {
                only_integer: true,
                greater_than_or_equal_to: 0,
                less_than_or_equal_to: 100000000
            }

  belongs_to :user
  belongs_to :project
end

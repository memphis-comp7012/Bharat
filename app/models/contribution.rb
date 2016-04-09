# == Schema Information
#
# Table name: contributions
#
#  id             :integer          not null, primary key
#  score          :integer
#  money_received :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Contribution < ActiveRecord::Base
	validates :score,
	    numericality: { only_integer: true, greater_than_or_equal_to: -100, less_than_or_equal_to: 10000},
         presence: true
    validates :money_received,
      numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100000000},
      presence: true

end

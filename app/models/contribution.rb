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
end

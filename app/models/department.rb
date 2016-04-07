# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Department < ActiveRecord::Base
	has_many :profiles
	has_many :research_fields
end

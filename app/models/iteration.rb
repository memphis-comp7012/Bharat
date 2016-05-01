# == Schema Information
#
# Table name: iterations
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#

class Iteration < ActiveRecord::Base
	belongs_to :project
end

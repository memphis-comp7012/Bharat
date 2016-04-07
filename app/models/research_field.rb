# == Schema Information
#
# Table name: research_fields
#
#  id            :integer          not null, primary key
#  category      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#

class ResearchField < ActiveRecord::Base

  has_many :profile_research_fields
  belongs_to :department
end

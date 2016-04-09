# == Schema Information
#
# Table name: project_research_fields
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  project_id        :integer
#  research_field_id :integer
#

class ProjectResearchField < ActiveRecord::Base
	belongs_to :research_field
	belongs_to :project
end

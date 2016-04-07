# == Schema Information
#
# Table name: profile_research_fields
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  profile_id        :integer
#  research_field_id :integer
#

class ProfileResearchField < ActiveRecord::Base
  belongs_to :profile
  belongs_to :research_field
end

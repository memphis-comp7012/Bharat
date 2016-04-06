# == Schema Information
#
# Table name: research_fields
#
#  id         :integer          not null, primary key
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ResearchField < ActiveRecord::Base
end

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

require 'test_helper'

class ResearchFieldTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

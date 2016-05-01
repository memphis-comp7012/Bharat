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

require 'test_helper'

class IterationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: requests
#
#  id         :integer          not null, primary key
#  type       :integer
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  project_id :integer
#

require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

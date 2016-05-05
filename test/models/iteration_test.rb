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

  test "normal iteration should be valid" do
    iter = iterations(:one)
    assert iter.valid?
  end

  test "iteration with nil name should be invalid" do
    iter = iterations(:one)
    iter.name = nil
    assert iter.invalid?
  end

  test "iteration with empty name should be invalid" do
    iter = iterations(:one)
    iter.name = ''
    assert iter.invalid?
  end
end

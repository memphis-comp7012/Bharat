# == Schema Information
#
# Table name: contributions
#
#  id             :integer          not null, primary key
#  score          :integer
#  money_received :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#  project_id     :integer
#


require 'test_helper'

class ContributionTest < ActiveSupport::TestCase
  setup :initialize_test_data

  test "contribution with nil score should be invalid" do
    @contribution_1.score = nil
    assert @contribution_1.invalid?
  end

  test "contribution with empty score should be invalid" do
    @contribution_1.score = ''
    assert @contribution_1.invalid?
  end

  test "contribution with spaced score should be invalid" do
    @contribution_1.score = ' '
    assert @contribution_1.invalid?
  end

  test "contribution with invalid score should be invalid" do
    @contribution_1.score = 'twenty'
    assert @contribution_1.invalid?
  end

  test "contribution with score less than -100 should be invalid" do
    @contribution_1.score = -102
    assert @contribution_1.invalid?
  end

  test "contribution with score more than 10000 should be invalid" do
    @contribution_1.score = 1000000
    assert @contribution_1.invalid?
  end

  test "contribution with score between -100 more than 10000 should be valid" do
    @contribution_1.score = 29
    assert @contribution_1.valid?
  end

# test cases for money recieved
  test "contribution with nil money received should be invalid" do
    @contribution_1.money_received = nil
    assert @contribution_1.invalid?
  end

  test "contribution with empty money received should be invalid" do
    @contribution_1.money_received = ''
    assert @contribution_1.invalid?
  end

  test "contribution with spaced money received should be invalid" do
    @contribution_1.money_received = ' '
    assert @contribution_1.invalid?
  end

  test "contribution with invalid money received should be invalid" do
    @contribution_1.money_received = "Ten thousand"
    assert @contribution_1.invalid?
  end

  test "contributions with money received less than 0 should be invalid" do
    @contribution_1.money_received = -2
    assert @contribution_1.invalid?
  end

  test "contributions with money received more than 100000000 should be invalid" do
    @contribution_1.money_received = 1000000002
    assert @contribution_1.invalid?
  end

  test "contributions with money_received between -100 more than 100000000 should be valid" do
    @contribution_1.money_received = 10022
    assert @contribution_1.valid?
  end

# all reviewer data needed for tests are intialized here
  def initialize_test_data
    @contribution_1 = contributions(:contribution_1)
  end
end


  
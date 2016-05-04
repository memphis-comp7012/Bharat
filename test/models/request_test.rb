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
  setup :initialize_test_request

  test "should not save request with no type" do
    @request.type = nil
    assert @request.invalid?
  end

  test "should not save user with empty type" do
    @request.type = ''
    assert @request.invalid?
  end

  test "should not save user with spaced type" do
    @request.type = ' '
    assert @request.invalid?
  end

  test "should ensure type enum has the right indices" do
    @invalid_request_types.each_with_index do |item, index|
      assert_not_same Request.request_types[item], index
    end
  end

  test "should ensure type does not allow invalid enum values" do
    @valid_request_types.each_with_index do |item, index|
      assert_same Request.request_types[item], index
    end
  end

  test "should not save request with no status" do
    @request.status = nil
    assert @request.invalid?
  end

  test "should not save user with empty status" do
    @request.status = ''
    assert @request.invalid?
  end

  test "should not save user with spaced status" do
    @request.status = ' '
    assert @request.invalid?
  end

  test "should ensure status enum has the right indices" do
    @invalid_request_statuses.each_with_index do |item, index|
      assert_not_same Request.request_statuses[item], index
    end
  end

  test "should ensure status does not allow invalid enum values" do
    @valid_request_statuses.each_with_index do |item, index|
      assert_same Request.request_statuses[item], index
    end
  end

  def initialize_test_request
    @request = requests(:request)

    @valid_request_statuses = [:unapproved, :approved, :rejected]
    @invalid_request_statuses = [:rejected, :unapproved, :approved]

    @valid_request_types = [:join, :leave]
    @invalid_request_types = [:leave, :join]
  end
end

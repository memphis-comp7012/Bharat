# == Schema Information
#
# Table name: profiles
#
#  id                  :integer          not null, primary key
#  first_name          :string
#  last_name           :string
#  bio                 :text
#  education_level     :integer
#  phone_number        :integer
#  summary_of_projects :text
#  skills              :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  department_id       :integer
#


require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "normal profile should be valid" do
    rc = profiles(:rc)
    assert rc.valid?
  end

  test "profile with nil first name should be invalid" do
    rc = profiles(:rc)
    rc.first_name = nil
    assert rc.invalid?
  end

  test "profile with empty first name should be invalid" do
    rc = profiles(:rc)
    rc.first_name = ''
    assert rc.invalid?
  end

  test "profile with whitespace first name should be invalid" do
    rc = profiles(:rc)
    rc.first_name = '              '
    assert rc.invalid?
  end

  test "profile with first name length greater than 225 should be invalid" do
    rc = profiles(:rc)
    rc.first_name = ''
    for i in 1..230 do 
      rc.first_name = rc.first_name+'a'
    end
    assert rc.invalid?
  end

  test "profile with nil last name should be invalid" do
    rc = profiles(:rc)
    rc.last_name = nil
    assert rc.invalid?
  end

  test "profile with empty last name should be invalid" do
    rc = profiles(:rc)
    rc.last_name = ''
    assert rc.invalid?
  end


  test "profile with whitespace last name should be invalid" do
    rc = profiles(:rc)
    rc.last_name = '               '
    assert rc.invalid?
  end

  test "profile with last name length greater than 225 should be invalid" do
    rc = profiles(:rc)
    rc.last_name = ''
    for i in 1..230 do 
      rc.last_name = rc.last_name+'a'
    end
    assert rc.invalid?
  end

  test "profile with empty phone number should be invalid" do
    rc = profiles(:rc)
    rc.phone_number = ''
    assert rc.invalid?
  end

  test "profile with 11 digit phone number should be invalid" do
    rc = profiles(:rc)
    rc.phone_number = 12345678900
    assert rc.invalid?
  end

  test "profile with nil education level should be invalid" do
    rc = profiles(:rc)
    rc.education_level = nil
    assert rc.invalid?
  end

  test "profile with empty education level should be invalid" do
    rc = profiles(:rc)
    rc.education_level = ''
    assert rc.invalid?
  end

  test "profile education level enum should have right indices" do
    education_levels = [:undergraduate, :graduate, :phd]
    education_levels.each_with_index do |item, index|
      assert_same Profile.education_levels[item], index
    end
  end

  test "profile education level enum should not allow invalid enum values" do
    education_levels = [:phd, :undergraduate, :blah]
    education_levels.each_with_index do |item, index|
      assert_not_same Profile.education_levels[item], index
    end
  end
end

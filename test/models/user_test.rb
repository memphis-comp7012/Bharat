# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  profile_id             :integer
#  role                   :integer
#


require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup :initialize_test_users
  
  # Valid user test
  test "should save user with valid email,password, password_confirmaton, role" do
    assert @chandra.save
  end

  # Email validation tests
  test "should not save user with no email" do
    @chandra.email = nil
    assert @chandra.invalid?
  end

  test "should not save user with empty email" do
    @chandra.email = ''
    assert @chandra.invalid?
  end

  test "should not save user with spaced email" do
    @chandra.email = ' '
    assert @chandra.invalid?
  end

  test "should not save user with invalid email" do
    @chandra.email = 'bad@user'
    assert @chandra.invalid?
  end

  test "should not save user with existing email" do
    @lasya.email = @chandra.email
    assert @lasya.invalid?
  end

  # Password validation tests
  test "should not save user with no password" do
    paul = User.new :email => 'paul@memphis.edu',
                    :password => nil,
                    :password_confirmation => nil,
                    :role => 'student'
    assert_not paul.save
  end

  test "should not save user with empty password" do
    adam = User.new :email => 'adam@memphis.edu',
                    :password => '',
                    :password_confirmation => '',
                    :role => 'student'
    assert_not adam.save
  end

  test "should not save user with spaced password" do
    parker = User.new :email => 'parker@memphis.edu',
                      :password => ' ',
                      :password_confirmation => ' ',
                      :role => 'student'
    assert_not parker.save
  end

  test "should not save user without proper password confirmation" do
    steve = User.new :email => 'steve@memphis.edu',
                     :password => 'top',
                     :password_confirmation => 'secret',
                     :role => 'student'
    assert_not steve.save
  end

  # Role validation tests
  test "should not save user with no role" do
    @lasya.role = nil
    assert @lasya.invalid?
  end

  test "should not save user with empty role" do
    @lasya.role = ''
    assert @lasya.invalid?
  end

  test "should not save user with spaced role" do
    @lasya.role = ' '
    assert @lasya.invalid?
  end

  test "should ensure role enum has the right indices" do
    @valid_roles.each_with_index do |item, index|
      assert_same User.roles[item], index
    end
  end

  test "should ensure role does not allow invalid enum values" do
    @invalid_roles.each_with_index do |item, index|
      assert_not_same User.roles[item], index
    end
  end

  # all user data needed for tests are initialized here
  def initialize_test_users
    @chandra = users(:chandra)
    @lasya = users(:lasya)
    @valid_roles = [:student, :faculty, :admin]
    @invalid_roles = [:admin, :student, :faculty]
  end
end

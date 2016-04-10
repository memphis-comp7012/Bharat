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


class User < ActiveRecord::Base
  # BE CAREFUL: Don't change the existing order, add before admin if you add new roles
  # last role must be admin always
enum role: [:student, :faculty, :admin]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable
         #, :validatable  -> Commented out this default to allow custom validations


  # Model validations
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: Devise.email_regexp }

  validates :password,
            presence: true,
            confirmation: true,
            length: { in: Devise.password_length }

  validates :role,
            presence: true,
            inclusion: {
                in: roles.keys[0..-1-1],
                message: "must be either " + roles.keys[0..-1-1].join(" or ") # build error message except last role
            }

  # Model Associations
  belongs_to :profile
  has_many :teams
  has_many :contributions
end

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
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  first_name             :string
#  last_name              :string
#  role                   :integer
#  status                 :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
  
  
  has_one :account, dependent: :destroy
  accepts_nested_attributes_for :account
  
         
  # Devise validates email and password automatically
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  enum role: [:pending, :user, :manager, :admin]
  enum status: [:banned, :inactive, :active]
  
  # sets default settings and build account for user
  after_initialize :set_default_role_and_status, :if => :new_record?
  after_initialize :build_new_account, :if => :new_record?
  
  def set_default_role_and_status
    self.role ||= :pending
    self.status ||= :inactive
  end
  
  def build_new_account
    self.account ||= self.build_account()
  end

  
end

class Account < ActiveRecord::Base
  
  belongs_to :user
  
  # Validations
  validates_presence_of :user_id, :on => :update
  validates_presence_of :birth_name, :on => :update
  #validates_presence_of :birth_date, :on => :update
  #validates_presence_of :gender, :on => :update
  #validates_presence_of :birth_place, :on => :update
  #validates_presence_of :birth_number, :on => :update
  #validates_presence_of :nationality, :on => :update
  #validates_presence_of :family_status, :on => :update
  #validates_presence_of :bank_acc, :on => :update
  #validates_presence_of :insurance, :on => :update
  #validates_presence_of :occupation, :on => :update
  #validates_presence_of :terms, :on => :update
  
  
  #attr_accessor :user_id
  
  # enums
  enum degree_before: [:ing, :phdr]
  enum degree_after: [:csc, :dis]
  enum gender: [:man, :woman]
  enum family_status: [:single, :married, :widow]
  
  #  enum family_status: #[:banned, :inactive,:active]
  #  enum occupation: #[:man, :woman]
  enum status: [:ended, :started, :completed]
  
  # set default entries
  after_initialize :set_default_values, :if => :new_record?
  
  def set_default_values
    self.status ||= :started
    self.terms  ||= false
  end
  
  
end

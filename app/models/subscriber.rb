class Subscriber < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.email_list
    pluck(:email)
  end
end

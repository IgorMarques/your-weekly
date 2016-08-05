class Post < ApplicationRecord
  validates_presence_of :title, :url

  scope :not_sent, -> { where(sent_on: nil) }
  scope :sent, -> { where.not(sent_on: nil) }
end

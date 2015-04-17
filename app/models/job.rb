class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :user

  has_many :applications

  validates :company_id, presence: true
  validates :title, presence: true
  validates :user_id, presence: true
end

class Job < ActiveRecord::Base
  belongs_to :company

  has_many :applications

  validates :company_id, presence: true
  validates :title, presence: true
end

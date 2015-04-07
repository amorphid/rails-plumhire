class Job < ActiveRecord::Base
  belongs_to :company

  validates :company_id, presence: true
  validates :title, presence: true
end

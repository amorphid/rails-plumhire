class Application < ActiveRecord::Base
  belongs_to :job

  validates :email, presence: true
  validates :job_id, presence: true
end

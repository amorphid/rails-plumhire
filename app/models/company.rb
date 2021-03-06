class Company < ActiveRecord::Base
  belongs_to :user

  has_many :jobs

  validates :name, presence: true
  validates :user_id, presence: true
end

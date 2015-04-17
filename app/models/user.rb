class User < ActiveRecord::Base
  has_secure_password

  has_many :companies
  has_many :jobs

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end

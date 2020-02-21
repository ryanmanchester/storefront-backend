class User < ApplicationRecord
  has_secure_password
  validates :username, uniquieness: true, presence: true
end

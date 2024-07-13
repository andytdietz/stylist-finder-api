class User < ApplicationRecord
  has_secure_password
  enum user_type: [:client, :stylist]

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
  validates :role, presence: true
end

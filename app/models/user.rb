class User < ApplicationRecord
  has_secure_password
  has_one :stylist

  validates :email, presence: true, uniqueness: true
  validates :user_type, presence: true, inclusion: { in: %w[stylist client] }
end

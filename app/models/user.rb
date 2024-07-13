class User < ApplicationRecord
  has_secure_password
  enum user_type: [:client, :stylist]

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
  validates :user_type, presence: true

  has_one :stylist
  has_one :client

  accepts_nested_attributes_for :stylist, :client  # If using nested attributes
end

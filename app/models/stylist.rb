class Stylist < ApplicationRecord
  belongs_to :user

  validates :name, :address1, :city, :state, :zip, presence: true
end

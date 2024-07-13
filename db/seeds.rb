# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Stylist.create(
  name: "Andy",
  address1: "123 fake st",
  address2: "unit c",
  city: "denver",
  state: "CO",
  zip: "80224",
  website: "google.com",
  instagram_url: "instagram.com",
  facebook_url: "facebook.com",
  user_id: 1,
  booking_url: "vagaro.com",
)

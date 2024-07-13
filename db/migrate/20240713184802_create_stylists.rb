class CreateStylists < ActiveRecord::Migration[7.1]
  def change
    create_table :stylists do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :website
      t.string :instagram_url
      t.string :facebook_url
      t.string :booking_url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

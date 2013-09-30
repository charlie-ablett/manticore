class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.integer :street_number
      t.integer :street_name
      t.integer :apartment_number
      t.string :suburb_name
      t.string :rural_delivery
      t.integer :city_id
      t.string :post_code

      t.timestamps
    end
  end
end

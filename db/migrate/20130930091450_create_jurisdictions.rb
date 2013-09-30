class CreateJurisdictions < ActiveRecord::Migration
  def change
    create_table :jurisdictions do |t|
      t.string :name
      t.integer :country_id
      t.string :type

      t.timestamps
    end
  end
end

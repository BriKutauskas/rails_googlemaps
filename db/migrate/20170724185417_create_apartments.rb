class CreateApartments < ActiveRecord::Migration[5.1]
  def change
    create_table :apartments do |t|
      t.text :street
      t.float :latitude
      t.float :longitude
      t.text :city
      t.text :zip
      t.text :state
      t.text :country
      t.text :name
      t.text :phone
      t.text :hours_contact

      t.timestamps
    end
  end
end

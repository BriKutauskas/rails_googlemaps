json.extract! apartment, :id, :street, :latitude, :longitude, :city, :zip, :state, :country, :name, :phone, :hours_contact, :created_at, :updated_at
json.url apartment_url(apartment, format: :json)

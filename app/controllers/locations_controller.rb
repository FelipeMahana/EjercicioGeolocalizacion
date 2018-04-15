class LocationsController < ApplicationController
  def index
    if user_signed_in?
      @store = Store.near(
        current_user.address,
        8_000,
        units: :km)
    else
      @stores = Store.all
    end 
    #cuarda las tiendas, longitud y latitud en un hash
    @hash = Gmaps4rails.build_markers(@stores) do |store, marker|
       marker.lat(store.latitude)
       marker.lng(store.longitude)
    end
  end

  def get_location
  end

  def find_address
  	latitude = params[:latitude]
  	longitude = params[:longitude]

  	address = Geocoder.address([latitude, longitude])
  		#response = { address: Geocoder.address(
		# [params[:latitude], params[:longitude]]
		# ) }
	render json: address.to_json
  end
end

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/vehicles" do
    vehicles = Vehicle.all
    vehicles.to_json
  end

  get "/vehicles/:id" do
    vehicle = Vehicle.find(params[:id])
    vehicle.to_json
  end

  get "/hosts/:id" do
    host = Host.find(params[:id])
    host.to_json # also send vehicles associated with this host
  end

  get "/guests/:id" do
    guest = Guest.find(params[:id])
    guest.to_json
  end

  post "/reservations" do
    reservation = Reservation.create(
      start_date: params[:start_date],
      end_date: params[:end_date],
      guest_id: params[:guest_id],
      vehicle_id: params[:vehicle_id]
    )
    reservation.to_json
  end

  patch "/reservations/:id" do
    # change a reservation
  end

  delete "/reservations/:id" do
    Reservation.destroy(params[:id])
  end

end

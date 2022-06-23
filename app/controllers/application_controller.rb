require 'pry'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/vehicles" do
    vehicles = Vehicle.all
    vehicles.to_json(include: :host)
  end

  get "/vehicles/:id" do
    vehicle = Vehicle.find(params[:id])
    vehicle.to_json #also send host & res. associated with vehicle
  end

  get "/hosts/:id" do
    host = Host.find(params[:id])
    host.to_json(include: :vehicles)
  end

  # get "/guests/:id" do
  #   guest = Guest.find(params[:id])
  #   guest.to_json(include: [:reservations => {include: :vehicle}])
  # end

  get "/guests/active" do
    guest = Guest.find_logged_in_user
    if guest 
      guest.to_json(include: [:reservations => {include: :vehicle}])
    else
      status 404
    end
  end

  post "/guests" do
    unless Guest.is_existing_user?(params[:username])
      new_guest = Guest.create(
        username: params[:username],
        profile_image_url: Faker::Avatar.image,
        logged_in: true
      )
      Guest.log_in_new_user(params[:username])
      new_guest.to_json
    else
      guest = Guest.log_in_new_user(params[:username])
      guest.to_json(include: [:reservations => {include: :vehicle}])
    end
  end

  get "/reservations/:id" do
    reservation = Reservation.find(params[:id])
    reservation.to_json
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
    reservation = Reservation.find(params[:id])
    reservation.update(reservation_params)
    reservation.to_json
  end

  delete "/reservations/:id" do
    reservation = Reservation.destroy(params[:id])
    reservation.to_json
  end

  private

  def reservation_params
    allowed_params = %w(start_date end_date)
    params.select {|param, value| allowed_params.include?(param)}
  end

end

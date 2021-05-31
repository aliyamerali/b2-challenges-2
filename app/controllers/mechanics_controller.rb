class MechanicsController < ApplicationController
  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides.open_by_thrill
  end

  def add_ride
    mechanic = Mechanic.find(params[:id])
    ride = Ride.find(params[:ride_id])
    mechanic.rides << ride

    redirect_to "/mechanics/#{params[:id]}"
  end
end

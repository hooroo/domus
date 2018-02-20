class TripsController < ApplicationController
  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.create(trip_params)

    respond_with @trip, location: -> { trips_path }
  end

  private

  def trip_params
    params.require(:trip).permit!
  end
end

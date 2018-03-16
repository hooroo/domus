class TripsController < ApplicationController
  def index
    @all_trips = Trip.all.limit(10)
    @current_trips = Trip.current.by_start_date.limit(10)
    @past_trips = Trip.past.limit(10)
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.create(trip_params)

    respond_with @trip, location: -> { trips_path }
  end

  def edit
  end

  def update
    trip.update_attributes(trip_params)

    respond_with @trip, location: -> { trips_path }
  end

  def destroy
    trip.delete

    respond_with @trip, location: -> { trips_path }
  end

  private

  def trip_params
    params.require(:trip).permit!
  end

  def trip
    @trip ||= Trip.find(params[:id])
  end
  helper_method :trip
end

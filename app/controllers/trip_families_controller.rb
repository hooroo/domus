class TripFamiliesController < ApplicationController
  def index
    @trip_families = trip.trip_families.all
  end

  def show
    @trip_family = trip.trip_families.find(params[:id])
  end

  def new
    @trip_family = trip.trip_families.new
  end

  def create
    @trip_family = trip.trip_families.create(trip_family_params)

    respond_with [trip, @trip_family],
      location: -> { trip_path(@trip) }
  end

  private

  def trip_family_params
    params.require(:trip_family).permit(
      :family_id,
      :total_boys,
      :total_bus_drivers,
      :total_girls,
      :total_techers,
      :trip_id,
    )
  end

  def trip
    @trip = Trip.find(params[:trip_id])
  end
  helper_method :trip
end

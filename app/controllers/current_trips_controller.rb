class CurrentTripsController < ApplicationController
  def index
    @trips = Trip.current.by_start_date
  end
end

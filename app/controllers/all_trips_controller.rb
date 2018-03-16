class AllTripsController < ApplicationController
  def index
    @trips = Trip.all.by_start_date
  end
end

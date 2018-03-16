class PastTripsController < ApplicationController
  def index
    @trips = Trip.past
  end
end

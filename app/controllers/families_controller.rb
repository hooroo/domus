class FamiliesController < ApplicationController
  def new
  end

  def create
    family = Family.new
    family.first_name = params[:first_name]
    family.last_name = params[:last_name]
    family.address = params[:address]
    family.animals = params[:animals]
    family.capability = params[:capability]
    family.prof = params[:prof]
    family.preffered_gender = params[:preffered_gender]
    family.bus_driver = params[:bus_driver]
    family.active = params[:active]

    if family.save
      redirect_to '/'
    else
      #
    end
  end

  def destroy
  end
end

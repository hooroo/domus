class FamiliesController < ApplicationController
  def index
    @family = Family.new
    @families = Family.display
  end

  def create
    family = Family.create(family_params)
    if family.save
      redirect_to root_path
    else
      redirect_to '/'
    end
  end

  def destroy
  end

  private
  def family_params
    params.require(:family).permit(:first_name, :last_name, :address, :animals, :capability, :preffered_gender, :prof, :bus_driver, :active)
  end
end

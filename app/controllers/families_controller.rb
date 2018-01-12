class FamiliesController < ApplicationController


  def index
    @families = Family.display
  end

  def new
    @family = Family.new
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
    params.require(:family).permit(:first_name, :last_name, :address, :animals, :capability, :preferred_gender, :prof, :bus_driver, :active)
  end
end

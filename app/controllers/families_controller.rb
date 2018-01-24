class FamiliesController < ApplicationController
  def index
    @families = Family.all
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.create(family_params)
    respond_with @family
  end

  private
  def family_params
    params.require(:family).permit(
      :first_name,
      :last_name,
      :address,
      :animals,
      :capability,
      :preferred_gender,
      :prof,
      :bus_driver,
      :active
    )
  end
end

class FamiliesController < ApplicationController
  def index
    @families = Family.all
    @active_families = Family.active
    @inactive_families = Family.inactive
  end

  def show
    @family = Family.find(params[:id])
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.create(family_params)

    respond_with @family, location: -> { families_path }
  end

  def edit
  end

  def update
    family.update_attributes(family_params)

    respond_with @family, location: -> { families_path }
  end

  def destroy
    family.delete

    respond_with @family, location: -> { families_path }
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
      :active,
    )
  end

  def family
    @family ||= Family.find(params[:id])
  end
  helper_method :family
end

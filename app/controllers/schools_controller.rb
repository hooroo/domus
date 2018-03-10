class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def new
    @school = School.new
  end

  def create
    @school = School.create(school_params)

    respond_with @school, location: -> { schools_path }
  end

  def edit
  end

  def update
    school.update_attributes(school_params)

    respond_with @school, location: -> { schools_path }
  end

  def destroy
    school.delete

    respond_with @school, location: -> { schools_path }
  end

  private

  def school_params
    params.require(:school).permit(
      :name,
      :responsible_name,
      :responsible_contact,
      :notes,
    )
  end

  def school
    @school ||= School.find(params[:id])
  end
  helper_method :school
end

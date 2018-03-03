class InactiveFamiliesController < ApplicationController
  def index
    @families = Family.inactive.by_last_name.page(params[:page]).per(10)
  end
end

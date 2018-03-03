class ActiveFamiliesController < ApplicationController
  def index
    @families = Family.active.by_last_name.page(params[:page]).per(10)
  end
end

class AllFamiliesController < ApplicationController
  def index
    @families = Family.all.by_last_name.page(params[:page]).per(10)
  end
end

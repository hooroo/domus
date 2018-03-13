class AllFamiliesController < ApplicationController
  def index
    @families = Family.all
  end
end

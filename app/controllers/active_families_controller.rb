class ActiveFamiliesController < ApplicationController
  def index
    @families = Family.active
  end
end

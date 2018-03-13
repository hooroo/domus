class InactiveFamiliesController < ApplicationController
  def index
    @families = Family.inactive
  end
end

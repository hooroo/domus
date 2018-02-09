class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)

    respond_with @group, location: -> { groups_path }
  end

  private

  def group_params
    params.require(:group).permit(
      :name,
      :responsable_name,
      :responsable_contact,
      :from_date,
      :to_date,
      :notes,
    )
  end
end

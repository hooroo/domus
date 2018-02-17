class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)

    respond_with @group, location: -> { groups_path }
  end

  def edit
  end

  def update
    group.update_attributes(group_params)

    respond_with @group, location: -> { groups_path }
  end

  def destroy
    group.delete

    respond_with @group, location: -> { groups_path }
  end

  private

  def group_params
    params.require(:group).permit(
      :name,
      :responsable_name,
      :responsable_contact,
      :start_date,
      :end_date,
      :notes,
    )
  end

  def group
    @group ||= Group.find(params[:id])
  end
  helper_method :group
end

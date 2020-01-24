class GroupsController < ApplicationController
  before_action :set_group, only: %i( show edit update destroy)

  layout 'group'

  def index
  end


  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path, notice: 'グループを作成しました'
    else
      render action: :new
    end
  end

  def show
    @groups = Group.all
    @grouplists = Grouplist.where(user: current_user, group: @group).order("created_at ASC")
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path(@group), notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, alert: 'グループを削除しました'
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end

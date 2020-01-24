class GrouplistController < ApplicationController
  before_action :set_group, only: %i( new create edit update )
  before_action :set_grouplist, only: %i( edit update destroy )

  layout 'group'

  def index
  end

  def new
    @grouplist = Grouplist.new
    # @grouplists = @group.grouplist.includes(:user)
  end

  def create
    @grouplist = @group.grouplists.new(grouplist_params)
    if @grouplist.save
      redirect_to group_path(@group)
    else
      render action: :new
    end
  end

  def show
    @grouplists = Grouplist.find(params[:id]).order("created_at ASC")
  end

  def edit
  end

  def update
    if @grouplist.update_attributes(grouplist_params)
      redirect_to group_path(@group)
    else
      render action: :edit
    end
  end

  def destroy
    @grouplist.destroy
    redirect_to group_path(@grouplist.group_id)
  end

  private

    def grouplist_params
      params.require(:grouplist).permit(:title).merge(user_id: current_user.id)
    end

    def set_group
      @group = Group.find(params[:group_id])
    end

    def set_grouplist
      # binding.pry
      @grouplist = Grouplist.find(params[:id])
    end
end

class GroupcardController < ApplicationController
  before_action :set_groupcard, only: %i( show edit update destroy)
  before_action :set_grouplist, only: %i( new create show edit update destroy )

  layout 'group'

  def new
    @groupcard = Groupcard.new
  end

  def create
    @groupcard = Groupcard.new(groupcard_params)
    if @groupcard.save
      redirect_to group_path(@grouplist.group_id)
    else
      render action: :new
    end
  end

  def show
  end

  def update
    if @groupcard.update_attributes(groupcard_params)
      redirect_to group_path(@grouplist.group_id)
    else
      render action: :edit
    end
  end

  def destroy
    @groupcard.destroy
    redirect_to group_path(@grouplist.group_id,@grouplist)
  end



  private

  def groupcard_params
    params.require(:groupcard).permit(:title, :memo, :status, :grouplist_id)
  end

  def set_groupcard
    @groupcard = Groupcard.find_by(id: params[:id])
  end

  def set_grouplist
    @grouplist = Grouplist.find(params[:grouplist_id])
  end
end

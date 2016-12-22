class GroupsController < ApplicationController
  def new
    @groups=Group.all
    render 'new'
  end

  def create
    @group=User.find(current_user).groups.create(group_params)
    if @group.valid?
    session[:group_id]=@group.id
      redirect_to '/groups/new'
    else
      flash[:errors] = @group.errors.full_messages
      redirect_to '/groups/new'
    end
  end

  def show
    @group=Group.find(params[:id])
    @joins=Join.where(group_id:@group.id)
    render 'show'
  end



  private
  def group_params
    params.require(:group).permit(:name,:description)
  end
end

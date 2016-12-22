class JoinsController < ApplicationController
  def create
    Group.find(params[:g_id]).joins.create(user: current_user)
    redirect_to "/groups/#{params[:g_id]}"
  end

  def destroy
    Join.find_by_user_id_and_group_id(current_user.id,params[:id]).delete
    redirect_to '/groups/new'
  end

end

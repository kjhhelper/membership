class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id]=@user.id
      redirect_to "/groups/new"
    else
      flash[:logerrors] = 'Invalid email/password combination'
      redirect_to '/main'
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to '/main'
  end
end

class UsersController < ApplicationController
  before_action :admin_user, only: [:edit]

  def show
    if (User.find_by_id(params[:id]))
      @user = User.find_by_id(params[:id])
      @param = params[:param]
      # redirect_to users_path(@user)
    else
      redirect_to root_path, :notice => "User not found"
    end
  end

  def edit

  end

  def admin_user
    unless isAdmin? || current_user and current_user.id == params[:id]
      flash[:danger] = "You have not permission to do this."
      redirect_to root_path
    end
  end


end

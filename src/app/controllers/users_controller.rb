class UsersController < ApplicationController
  before_action :admin_user, only: %i[edit]

  def show
    @user = User.find_by_id(params[:id])
    if @user
      @param = params[:param]
      # redirect_to users_path(@user)
    else
      redirect_to root_path, notice: 'User not found'
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])

    @user.destroy unless user

    redirect_to root_path
  end

  def admin_user
    is_permitted = isAdmin? || (current_user && current_user.id == params[:id])
    return nil unless is_permitted

    flash[:danger] = 'You have not permission to do this.'
    redirect_to root_path
  end
end

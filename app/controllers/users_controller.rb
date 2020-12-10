class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  
  def index
    if current_user.has_role?(:super) | current_user.has_role?(:admin)
      @users = User.all.order(created_at: :desc)
    else
      redirect_to root_path, alert: 'You do not have access'
    end 
  end
  
  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'User roles were successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit({role_ids: []})
  end
end

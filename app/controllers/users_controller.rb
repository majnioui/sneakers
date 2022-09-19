class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Successfully updated"
    else
      render :edit
    end
  end

  def index
    @users = User.all
    authorize @users
  end
  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit({ role_ids: [] })
  end
end

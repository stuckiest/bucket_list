class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
    @buckets = @user.goals
  end

  def edit
  end

  def new
  end

  def profile
    @current_user = current_user
    @goals = @current_user.goals
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end

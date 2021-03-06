class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) #passing Id for current_user
    # @goals = Goal.where(user_id: params[:id]) 
    @user_goals = @user.goals
  end

  def profile
     @user = current_user
     @goals = @user.goals
  end

  # private
  # devise handles this so we don't need it here.
  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :email, :password)
  # end
end

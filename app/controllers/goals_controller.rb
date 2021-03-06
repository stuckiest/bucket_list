class GoalsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @goal = Goal.new(user_id: params[:user_id])
  end

  def create
    @goal = Goal.new(goal_params)
    @user = User.find(params[:user_id])

    if @goal.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @goal = Goal.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to profile_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(current_user)
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to profile_path
  end

  def index
    # @goals = Goal.all
  end

  def show
    # @goal = Goal.find(params[:id])
  end

  private
  def goal_params
    params.require(:goal).permit(:title, :description, :location, :completed, :user_id, :category => [])
  end

end

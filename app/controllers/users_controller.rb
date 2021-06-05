class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end
  def def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User successfully created. Welcome #{ @user.username } "
      redirect_to @user
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @articles = @user.articles
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User was successfully updated"
      redirect_to @user
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.permit(:username, :email, :password)
  end
end
class UsersController < ApplicationController
  def def new
    @user = User.new
  end

  def create
    @user = User.new(article_params)
    if @user.save
      flash[:success] = "User successfully created. Welcome #{ @user.username } "
      redirect_to @user
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def article_params
    params.permit(:username, :email, :password)
  end
end
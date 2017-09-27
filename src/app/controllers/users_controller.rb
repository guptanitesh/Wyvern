class UsersController < ApplicationController
  before_action :isCorrect,   only: [:edit, :update]
  before_action :isLoggedIn, only: [:destroy, :index, :edit, :update]
  before_action :isAdmin,     only: :destroy

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Wyvern: The Ultimate Quiz Game!"
      redirect_to(root_url)
    else
      render 'new'
    end
  end

  def isCorrect
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to(root_url) 
    end
  end

  def isAdmin
    unless current_user.admin?
      redirect_to(root_url) 
    end
  end

  def isLoggedIn
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :username, :password)
    end
    
end

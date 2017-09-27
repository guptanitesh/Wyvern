class QuizzsController < ApplicationController
  before_action :isLoggedIn, only: [:new, :create]
  before_action :isAdmin,    only: [:new, :create,]
 


  def new
    @quizz = Quizz.new
  	@subcategories = Subcategory.all
  end

  def create
    @quizz = Quizz.new(quizz_params)
    puts @quizz
    if @quizz.save
      flash[:success] = "New Quizz Added"
      redirect_to quizzs_path
    else
      redirect_to quizzs_new_path
    end
  end

  def edit
    @quizz = Quizz.find(params[:id])  
  end

  def update
    @quizz = Quizz.find(params[:id])  
    if @quizz.update_attributes(quizz_params)
      flash[:success] = "Quizz Edited"
      redirect_to @quizz
    else
      redirect_to edit_quizz_path
    end
  end  

  def destroy
   quizz = Quizz.find(params[:id]) 
   Quizz.find(params[:id]).destroy
   flash[:success] = 'Quizz is successfully deleted.'
   redirect_to quizzs_path
 end

  def index
    @user = current_user
    @attempts = Score.where(user_id: @user.id).all
    @quizzs = Quizz.paginate(page: params[:page], per_page: 10)
  end

  def show
    @quizz = Quizz.find(params[:id])
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

  def quizz_params
    params.require(:quizz).permit(:name, :subcategory_id)
  end

end

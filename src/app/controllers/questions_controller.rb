class QuestionsController < ApplicationController

  before_action :isLoggedIn, only: [:destroy, :index, :edit, :edit, :new, :create]
  before_action :isAdmin,    only: [:destroy, :new, :create, :edit]

  def index
    @questions = Question.paginate(page: params[:page], per_page: 10)
  end

  def new
  	@question = Question.new
  	@quizzs = Quizz.all
  end

  def show
    @question = Question.find(params[:id])
  end
  
  def edit
    @quizzs = Quizz.all
    @question = Question.find(params[:id])  
  end

  def update
    @question = Question.find(params[:id])  
    puts @question
    puts question_params
    if @question.update_attributes(question_params)
      flash[:success] = "Question editd"
      redirect_to @question
    else
      redirect_to edit_question_path
    end
  end

  def destroy
   question = Question.find(params[:id]) 
   Score.where(quizz_id: question.quizz_id).destroy_all 
   Question.find(params[:id]).destroy
   flash[:success] = 'Question was successfully destroyed.'
   redirect_to questions_path
 end

 def create
  @question = Question.new(question_params)
  if @question.save
    flash[:success] = "New Qusetion Added"
   redirect_to questions_path
  else
    redirect_to(root_url)
  end
end

def isAdmin
  unless current_user.admin?
   redirect_to questions_path
  end
end

def isLoggedIn
  unless logged_in?
    flash[:danger] = "Please log in."
    redirect_to login_url
  end
end

private
def question_params
  params.require(:question).permit(:body, :ftype, :asset, :quizz_id, :answer, :option1, :option2, :option3, :option4, :qtype)
end
end

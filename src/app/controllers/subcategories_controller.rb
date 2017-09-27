class SubcategoriesController < ApplicationController
  before_action :isLoggedIn, only: [:create, :new]
  before_action :isAdmin,     only: [:create, :new]
  
  def new
    @subcategory = Subcategory.new
    @categories = Category.all  	
  end

  def index
    @subcategories = Subcategory.paginate(page: params[:page], per_page: 10)
  end

  def show
    @subcategory = Subcategory.find(params[:id])
    @quizzs = Quizz.where(subcategory_id: @subcategory.id).all
  end

  def edit
    @categories = Category.all    
    @subcategory = Subcategory.find(params[:id])  
  end

  def update
    @subcategory = Subcategory.find(params[:id])  
    if @subcategory.update_attributes(subcategory_params)
      flash[:success] = "Subcategory Edited"
      redirect_to @subcategory
    else
      redirect_to edit_subcategory_path
    end
  end  

  def destroy
   subcategory = Subcategory.find(params[:id]) 
   Subcategory.find(params[:id]).destroy
   flash[:success] = 'Subcategory is successfully destroyed.'
   redirect_to subcategories_path
 end


  def create
    @subcategory = Subcategory.new(subcategory_params)
    if @subcategory.save
       redirect_to subcategories_path
    else
      redirect_to subcategories_new_path
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
    def subcategory_params
      params.require(:subcategory).permit(:name, :category_id)
    end

end

class CategoriesController < ApplicationController
  before_action :isLoggedIn, only: [:create, :new]
  before_action :isAdmin,     only: [:create, :new]
  
  def new
    @category = Category.new  	
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def show
    @category = Category.find(params[:id])
    @subcategories = Subcategory.where(category_id: @category.id).all
  end

  def edit
    @category = Category.find(params[:id])  
  end

  def update
    @category = Category.find(params[:id])  
    if @category.update_attributes(category_params)
      flash[:success] = "Category Edited"
      redirect_to @category
    else
      redirect_to edit_category_path
    end
  end  

  def destroy
   category = Category.find(params[:id]) 
   Category.find(params[:id]).destroy
   flash[:success] = 'Category is successfully destroyed.'
   redirect_to categories_path
 end

  def create  
    @category = Category.new(category_params)
    if @category.save
     redirect_to categories_path
    else
      render 'new'
    end
  end

  def isAdmin
    unless current_user.admin?
     redirect_to categories_path
    end
  end

  def isLoggedIn
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end


  private
    def category_params
      params.require(:category).permit(:name)
    end

end

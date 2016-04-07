class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]		
  before_action :find_category, only: [:show, :edit, :destroy, :update] 
  before_action :find_user, except: [:index]

  def index
  	@categories = Category.all
    @user = current_user
  end

  def show
  end

  def new
  	@category = Category.new
  end

  def create
  	 category = Category.new(category_params)
  	if category.save
  		redirect_to categories_path
  	else
  		render "new"	
  	end
  end

  def edit
  end

  def update
  	 if @category.update(category_params)
  	 	redirect_to categories_path
  	else
  		render "edit"	
  	 end
  end

  def destroy
  	if @category.destroy
  		redirect_to categories_path
  	end
  end

  private

  def find_category
  	@category = Category.find(params[:id])
  end

  def category_params
  	params.require(:category).permit(:name)
  end

  def find_user
		@user = current_user
  end

end

class BooksController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	before_action :find_user, except: [:index]
	before_action :find_book, only: [ :book_return, :show, :edit, :update, :destroy] 
	before_action :find_categories_array, only: [:new, :edit]

	def index
		@books = Book.all
		@user = current_user
	end

	def show
	end

	def new
		@book = Book.new
		#@category = Category.find(params[:category_id])
	end

	def create
		#raise @category.inspect
		#@category = Category.find(params[:category_id])
		book = Book.new(book_params)
		if book.save
			redirect_to books_path
		else
			render "new"
		end	
	end

	def edit
	end

	def update
	# raise params.inspect	
	   @category = @book.category
		if params[:user_id] == nil
			if @book.update(book_params)
				redirect_to books_path
			else
				render "edit"
			end
		else
			user = params[:user_id]
			if @book.update(user_id: user)
				#redirect_to category_path(@category)
				redirect_to :back
			end
		end		
	end

	def destroy
		if @book.destroy
			redirect_to books_path
		end	
	end

	def book_return
		#raise params.inspect
		if @book.update(user_id: 0)
			redirect_to books_path
		end
	end

	private

	def find_book
		@book = Book.find(params[:id])
	end

	def book_params
		params.require(:book).permit(:title, :description, :category_id) 
	end

	def find_categories_array
		@categories_array = Category.pluck(:name, :id) 
	end

	def find_category
		@category = Category.find(params[:category_id])
	end

	def find_user
		@user = current_user
	end

end

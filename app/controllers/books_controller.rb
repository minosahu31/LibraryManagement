class BooksController < ApplicationController
	before_action :authenticate_user!
	#before_action :find_users
	before_action :find_book, :find_category , only: [ :show, :edit, :update, :destroy] 
	before_action :find_categories_array, only: [:new, :edit]

	def index
		@books = Book.all
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
		if @book.update(book_params)
			redirect_to category_path(@category)
		else
			render "edit"
		end
	end

	def destroy
		if Book.destroy(@book)
			redirect_to category_path(@category)
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
		@categories_array = Category.all.map { |category| [category.name,category.id] } 
	end

	def find_category
		raise params.inspect
		@category = Category.find(params[:category_id])
	end

	def find_users
		@users = User.all
	end

end

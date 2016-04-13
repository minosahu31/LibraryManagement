class BooksController < ApplicationController
	#layout :append_layout
	before_action :authenticate_user!, except: [:index]
	before_action :find_user, except: [:index]
	before_action :find_book, only: [ :book_return, :show, :edit, :update, :destroy] 
	before_action :find_categories_array, only: [:new, :edit]

	def index 
		#render file: "/home/sahu/my_rails_work/MessageBoard/app/views/messages/index"
		@books = Book.all
		@book = Book.new
		#(Not Working)render js: "alert('Hello Rails');"
		#render xml: @books
		#render json: @books
		#render plain: "OK" 
		#render inline: "<% @books.each do |b| %><p><%= b.title %></p><% end %>"
		@user = current_user
		#(Didn't find any use)render status: 500
		#render status: :forbidden
		#render layout: false
		#(Not working)render xml: photo, location: photo_url("/home/sahu/background1.jpeg")
	end

	def show
		#respond_to do |format|
		#	format.html
		#	format.json{ render json: @book.as_json( only: [:id, :title] )}
	#	end
	end

	def new
		@book = Book.new
	end

	def create
		@book = Book.new(book_params)
		@book.save
		@books = Book.all
	end

	def edit
	end

	def update
	# raise params.inspect	
	   @category = @book.category
		if params[:user_id] == nil
			#if
			 @book.update(book_params)

			#	redirect_to books_path
			#else
			#	render "edit"
			#end
		else
			user = params[:user_id]
			user_book = @book.user_books.new(user_id: user)
			present_available_books = @book.present_available_books
			#raise book_count.inspect
			if user_book.save && @book.update(present_available_books: present_available_books-1)
			 #@books = Book.all
				#redirect_to category_path(@category)
				redirect_to :back
			end
		end		
	end

	

	def destroy
		#if
		 @book.destroy

			redirect_to books_path
		#end	
	end

	def book_return
		user_id = params[:user_id] 
		user_book_id = UserBook.find_by(book_id: @book, user_id: user_id)
			#raise @user_book_id.inspect
		if user_book_id.destroy
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

	def append_layout
		if user_signed_in?
			if current_user == "admin"
				layout "admin"
			else
				layout "user"
			end		
		end	
	end

end

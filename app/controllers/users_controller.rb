class UsersController < ApplicationController

  def create
  	@book = Book.find(params[:book_id])
  	user = current_user
  	user_book = Book.new(user_id :user)
  	if user_book.save
  		flash[:success] = "Book successfully booked"
  		redirect_to category_book_path(@book)
  	end
  end

end

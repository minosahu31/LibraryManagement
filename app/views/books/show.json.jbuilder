#we can use this syntax 
	#json.id @book.id
	#json.title @book.title
# Or this	
	#json.extract! @book, :id, :description
# Or this
   json.(@book, :id, :title )
   json.users @book.users 

   
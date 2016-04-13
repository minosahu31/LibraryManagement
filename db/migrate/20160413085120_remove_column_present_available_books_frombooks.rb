class RemoveColumnPresentAvailableBooksFrombooks < ActiveRecord::Migration
  def change
  	remove_column :books, :PresentAvailableBooks 
  end
end

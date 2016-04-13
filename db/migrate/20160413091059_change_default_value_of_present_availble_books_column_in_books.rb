class ChangeDefaultValueOfPresentAvailbleBooksColumnInBooks < ActiveRecord::Migration
  def change
  	change_column_default :books, :present_available_books, 1
  end
end

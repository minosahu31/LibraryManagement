class AddColumnPresentAvailableBooksToBooks < ActiveRecord::Migration
  def change
    add_column :books, :present_available_books, :integer     
  end
end

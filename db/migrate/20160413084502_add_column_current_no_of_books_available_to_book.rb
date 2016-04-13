class AddColumnCurrentNoOfBooksAvailableToBook < ActiveRecord::Migration
  def change
    add_column :books, :PresentAvailableBooks, :integer
  end
end

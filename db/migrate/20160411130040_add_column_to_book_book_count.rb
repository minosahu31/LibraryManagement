class AddColumnToBookBookCount < ActiveRecord::Migration
  def change
  	add_column :books, :book_count, :integer, :default => 1 
  end
end

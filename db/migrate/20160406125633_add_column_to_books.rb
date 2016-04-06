class AddColumnToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :user_id, :integer, default: 0
  end
end

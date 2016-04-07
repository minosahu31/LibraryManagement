class AddDefaultValueToBookUserId < ActiveRecord::Migration
 
  def change
	change_column_default :books, :user_id, 0 
  end

end

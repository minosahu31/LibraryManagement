class RemoveUserIdefaultFromBook < ActiveRecord::Migration
  def change
  	change_column_default :books, :user_id, nil
  end
end

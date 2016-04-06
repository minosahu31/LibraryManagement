class AddRoleColumnDefaultToUser < ActiveRecord::Migration
  def change
  	change_column_default :users, :role, " "
  end
end

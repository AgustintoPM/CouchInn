class AddUserid < ActiveRecord::Migration
  def change
  	add_column :hospedajesfeedbacks, :user_id, :integer
  end
end

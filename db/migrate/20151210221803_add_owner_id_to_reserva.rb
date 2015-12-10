class AddOwnerIdToReserva < ActiveRecord::Migration
  def change
    add_column :reservas, :propietario_id, :integer
  end
end

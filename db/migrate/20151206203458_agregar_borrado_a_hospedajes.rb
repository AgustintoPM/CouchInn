class AgregarBorradoAHospedajes < ActiveRecord::Migration
  def change
    add_column :hospedajes, :borrado, :boolean
  end
end

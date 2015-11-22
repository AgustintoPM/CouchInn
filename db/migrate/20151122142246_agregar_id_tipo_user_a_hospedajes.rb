class AgregarIdTipoUserAHospedajes < ActiveRecord::Migration
  def change
    add_column :hospedajes, :user_id, :integer
    add_column :hospedajes, :tipo_id, :integer
  end
end

class AgregarComentariosAHospedajes < ActiveRecord::Migration
  def change
    add_column :hospedajes, :comentario_id, :string
  end
end

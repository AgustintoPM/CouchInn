class CreateHospedajesfeedbacks < ActiveRecord::Migration
  def change
    create_table :hospedajesfeedbacks do |t|
      t.string :descripcion
      t.integer :puntaje
      t.integer :destino_id

      t.timestamps null: false
    end
  end
end

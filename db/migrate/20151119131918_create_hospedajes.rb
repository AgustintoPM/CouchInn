class CreateHospedajes < ActiveRecord::Migration
  def change
    create_table :hospedajes do |t|
      t.string :titulo
      t.string :lugar
      t.date :fecha
      t.string :foto
      t.boolean :disponible
      t.integer :capacidad
      t.string :descripcion

      t.timestamps null: false
    end
  end
end

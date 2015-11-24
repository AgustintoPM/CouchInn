class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.integer :user_id
      t.integer :hospedaje_id
      t.datetime :fecha
      t.boolean :aceptado

      t.timestamps null: false
    end
  end
end

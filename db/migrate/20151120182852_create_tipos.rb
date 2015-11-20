class CreateTipos < ActiveRecord::Migration
  def change
    create_table :tipos do |t|
      t.string :nombre
      t.boolean :disponible
      t.datetime :fecha

      t.timestamps null: false
    end
  end
end

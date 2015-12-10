class AddDetallesReservas < ActiveRecord::Migration
  def change
  	add_column :reservas, :desde, :date
    add_column :reservas, :hasta, :date
  end
end

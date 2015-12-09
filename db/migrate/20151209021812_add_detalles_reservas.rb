class AddDetallesReservas < ActiveRecord::Migration
  def change
  	add_column :reservas, :desde, :datetime
    add_column :reservas, :hasta, :datetime
  end
end

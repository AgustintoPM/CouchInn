class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.text :opinion
      t.string :hospedaje_id
      t.string :user_id

      t.timestamps null: false
    end
  end
end

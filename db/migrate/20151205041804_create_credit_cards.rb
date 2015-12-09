class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :adress
      t.string :cardtype
      t.string :lastfourdigit
      t.datetime :expdate
      t.string :phone
      t.string :name
      t.string :fullnumber
      t.timestamps null: false
    end
  end
end

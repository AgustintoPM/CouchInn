class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :premium, :boolean, default: false
    add_column :users, :credit_card, :string
  end
end

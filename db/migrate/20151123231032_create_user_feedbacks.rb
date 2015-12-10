class CreateUserFeedbacks < ActiveRecord::Migration
  def change
    create_table :user_feedbacks do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.integer :destination
      t.timestamps null: false
      t.integer :score
    end
   
	add_index :user_feedbacks, [:user_id, :created_at]
  end
end

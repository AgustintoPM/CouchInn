class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :content
      t.references :feedbackable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end

class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.string :email
      t.string :content

      t.timestamps
    end
  end
end

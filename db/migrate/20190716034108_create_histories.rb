class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :indentify_id
      t.integer :book_id
      t.integer :mode

      t.timestamps
    end
  end
end

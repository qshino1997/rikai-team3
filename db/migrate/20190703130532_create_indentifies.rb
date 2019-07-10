class CreateIndentifies < ActiveRecord::Migration[5.2]
  def change
    create_table :indentifies do |t|
      t.string :indentify_code
      t.integer :book_id

      t.timestamps
    end
  end
end

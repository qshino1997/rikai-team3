class CreateBorrows < ActiveRecord::Migration[5.2]
  def change
    create_table :borrows do |t|
      t.integer :user_id
      t.integer :soluongmuon
      t.integer :indentify_id

      t.timestamps
    end
  end
end

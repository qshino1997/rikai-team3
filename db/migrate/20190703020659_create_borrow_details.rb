class CreateBorrowDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :borrow_details do |t|
      t.integer :borrow_id
      t.datetime :thoigianmuon
      t.datetime :thoigiantra

      t.timestamps
    end
  end
end

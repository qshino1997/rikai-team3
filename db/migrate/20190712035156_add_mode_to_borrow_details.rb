class AddModeToBorrowDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :borrow_details, :mode, :tinyint
  end
end

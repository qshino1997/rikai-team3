class AddModeToBorrows < ActiveRecord::Migration[5.2]
  def change
    add_column :borrows, :mode, :tinyint
  end
end

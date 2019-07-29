class AddMode1ToBorrows < ActiveRecord::Migration[5.2]
  def change
    add_column :borrows, :mode1, :tinyint
  end
end

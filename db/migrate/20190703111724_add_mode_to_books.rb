class AddModeToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :mode, :tinyint, default: false
  end
end

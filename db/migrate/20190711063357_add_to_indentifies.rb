class AddToIndentifies < ActiveRecord::Migration[5.2]
  def change
    add_column :indentifies, :catogary_id, :integer
  end
end

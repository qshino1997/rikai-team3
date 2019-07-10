class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :tieude
      t.string :tacgia
      t.date :namxuatbang
      t.string :mota
      t.float :gia
      t.integer :catogary_id

      t.timestamps
    end
  end
end

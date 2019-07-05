class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :hoten
      t.string :email
      t.string :matkhau
      t.string :lop
      t.string :masv
      t.string :sdt 
      t.string :thuongtru

      t.timestamps
    end
  end
end

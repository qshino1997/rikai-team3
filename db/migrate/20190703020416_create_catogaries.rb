class CreateCatogaries < ActiveRecord::Migration[5.2]
  def change
    create_table :catogaries do |t|
      t.string :tenloai

      t.timestamps
    end
  end
end

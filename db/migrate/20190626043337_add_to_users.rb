class AddToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :namsinh_at, :datetime
    add_column :users, :admin, :boolean, default: false
  end
end

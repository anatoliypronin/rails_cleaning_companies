class AddIndexToEmail < ActiveRecord::Migration[6.0]
  def change
    add_index :admins, :email, unique: true
    add_index :clients, :email, unique: true
    add_index :companies, :email, unique: true
  end
end

class AddIndexToCityAndService < ActiveRecord::Migration[6.0]
  def change
    add_index :cities, :name, unique: true
    add_index :services, :name, unique: true
  end
end

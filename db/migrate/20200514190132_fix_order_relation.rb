class FixOrderRelation < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :orders, column: :company_id
    remove_foreign_key :orders, column: :service_id
    remove_column :orders, :company_id
    remove_column :orders, :service_id
    add_reference :orders, :service_price, foreign_key: true
    change_column :orders, :date_end, :datetime, :null => true
    remove_index :orders, name: 'index_orders_on_company_id'
    remove_index :orders, name: 'index_orders_on_service_id'
    add_column :orders, :price, :int
  end
end

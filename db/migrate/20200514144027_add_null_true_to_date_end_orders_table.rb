class AddNullTrueToDateEndOrdersTable < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :date_end, :datetime, :null => true
  end
end

class ChangeDateType < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :date_start, :datetime
    change_column :orders, :date_end, :datetime
  end
end

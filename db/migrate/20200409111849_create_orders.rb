class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.date :date_start
      t.date :date_end
      t.float :review

      t.timestamps
    end
  end
end

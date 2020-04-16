class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :service, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.string :state, null: false
      t.datetime :date_start, null: false
      t.datetime :date_end, null: false
      t.float :review, :default => 0.0

      t.timestamps
    end
  end
end

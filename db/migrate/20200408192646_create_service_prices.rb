class CreateServicePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :service_prices do |t|
      t.references :service, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.integer :price, null: false
      t.string :state, null: false
      t.timestamps
    end
  end
end

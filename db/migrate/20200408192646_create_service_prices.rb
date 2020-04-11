class CreateServicePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :service_prices do |t|
      t.integer :price
      t.string :state
      t.timestamps
    end
  end
end

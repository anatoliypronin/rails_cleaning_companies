class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :phonenumber, null: false

      t.timestamps
    end
  end
end

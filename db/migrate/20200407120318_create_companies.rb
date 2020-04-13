class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.text :requisites, null: false
      t.text :description
      t.float :rating
      t.string :website
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end

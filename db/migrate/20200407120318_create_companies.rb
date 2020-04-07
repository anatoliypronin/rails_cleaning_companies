class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.text :requisites
      t.text :description
      t.float :rating
      t.string :website
      t.string :phone_number

      t.timestamps
    end
  end
end

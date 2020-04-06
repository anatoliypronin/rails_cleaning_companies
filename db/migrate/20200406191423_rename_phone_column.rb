class RenamePhoneColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :clients, :phonenumber, :phone_number
  end
end

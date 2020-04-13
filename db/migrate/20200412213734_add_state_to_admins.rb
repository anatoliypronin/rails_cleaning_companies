class AddStateToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :state, :string, null: false
  end
end

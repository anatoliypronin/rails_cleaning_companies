class RenameDescAndBody < ActiveRecord::Migration[6.0]
  def change
    rename_column :articles, :description, :short_description
    rename_column :articles, :body, :description
  end
end

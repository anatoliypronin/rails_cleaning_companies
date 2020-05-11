class AddArticleRefToAdmin < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :admin, foreign_key: true, null: false
  end
end

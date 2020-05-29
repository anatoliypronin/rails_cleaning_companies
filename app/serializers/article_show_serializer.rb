class ArticleShowSerializer < ActiveModel::Serializer
  attributes :id, :title, :short_description, :description, :created_at
  belongs_to :admin, key: :author
end

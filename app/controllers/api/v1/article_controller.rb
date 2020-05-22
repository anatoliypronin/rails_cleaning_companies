class Api::V1::ArticleController < Api::V1::ApplicationController
  def index
    articles = Article.all.order(created_at: :asc)
    render json: articles, each_serializer: ArticleIndexSerializer
  end
end

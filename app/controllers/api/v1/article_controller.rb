class Api::V1::ArticleController < Api::V1::ApplicationController
  def index
    articles = Article.all.order(created_at: :desc)
    render json: articles, each_serializer: ArticleIndexSerializer
  end

  def show
    article = Article.find(params[:id])
    render json: article, serializer: ArticleShowSerializer
  end
end

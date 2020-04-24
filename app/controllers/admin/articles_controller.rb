class Admin::ArticlesController < Admin::ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_attrs)

    if @article.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  private

  def article_attrs
    params.require(:article).permit(:title, :short_description, :description)
  end
end

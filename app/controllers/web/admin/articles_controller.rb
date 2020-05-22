class Web::Admin::ArticlesController < Web::Admin::ApplicationController
  def index
    @articles = Article.all.page(params[:page]).decorate
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_attrs)
    @article.admin = current_admin
    if @article.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @article = Article.find(params[:id]).decorate
  end

  def edit
    @article = Article.find(params[:id])
    authorize @article
  end

  def update
    @article = Article.find(params[:id])
    authorize @article
    if @article.update(article_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    authorize article
    article.destroy
    redirect_to action: :index
  end

  private

  def article_attrs
    params.require(:article).permit(:title, :short_description, :description)
  end
end

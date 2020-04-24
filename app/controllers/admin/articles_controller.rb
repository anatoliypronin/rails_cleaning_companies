class Admin::ArticlesController < Admin::Application Controller
  def index
    @articles = Article.all
  end

end

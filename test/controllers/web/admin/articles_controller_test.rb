require 'test_helper'

class Web::Admin::ArticleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @article = create :article
  end

  test 'should get index articles page' do
    get admin_articles_path
    assert_response :success
  end

  test 'should get new article page' do
    get new_admin_article_path
    assert_response :success
  end

  test 'should create article' do
    article_attrs = attributes_for :article
    post admin_articles_path, params: { article: article_attrs }
    assert_response :redirect

    article = Article.last
    assert_equal article_attrs[:title], article.title
  end

  test 'should show article page' do
    get admin_article_path(@article)
    assert_response :success
  end

  test 'should get edit article page' do
    get edit_admin_article_path(@article)
    assert_response :success
  end

  test 'should put update article' do
    attrs = {}
    attrs[:title] = generate :title
    put admin_article_path(@article), params: { article: attrs }
    assert_response :redirect

    @article.reload
    assert_equal attrs[:title], @article.title
  end

  test 'should delete destroy article' do
    delete admin_article_path(@article.id)
    assert_response :redirect
    assert_not Article.exists?(@article.id)
  end

  test 'should put not update article admin by editor' do
    sign_out_as_admin
    editor = create :admin, :editor
    sign_in_as_admin(editor)
    attrs = {}
    attrs[:title] = generate :title
    put admin_article_path(@article), params: { article: attrs }
    assert_response :redirect
    @article.reload
    assert_not_equal attrs[:title], @article.title
  end
end

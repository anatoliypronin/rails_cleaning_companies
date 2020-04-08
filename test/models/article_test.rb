require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'Should create' do
    article = build :article
    article.save

    created_article = Article.last
    assert created_article
  end

  test "Shouldn't create, title is nil" do
    article = build :article, title: nil
    article.save

    created_article = Article.last
    assert_not created_article
  end

  test "Shouldn't create, title > 100 characters" do
    article = build :article,
                    title: "While many users need the functionality of a database management system like MySQL,they may not feel comfortable interacting with the system solely from the MySQL prompt."
    article.save

    created_article = Article.last
    assert_not created_article
  end
end

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "article is not created without a title" do
    article = Article.new
    assert_not article.valid?
    assert_not_nil article.errors[:title]
  end

  test ".word_count returns the correct number of words" do
    article = Article.new(body: "Hola Mundo. Esto es una prueba")
    assert_equal 6, article.word_count
  end

  test "published scope only returns published articles" do
    articles = Article.published
    assert_equal 1, articles.length

    assert_equal articles(:published).id, articles[0].id
  end
end

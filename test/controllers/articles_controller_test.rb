require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "get index is successful" do
    get articles_path
    assert_response :success
  end

  test "get index shows articles table" do
    get articles_path
    assert_select 'table > tbody > tr', 2
  end

  test "get new is successful" do
    get new_article_path
    assert_response :success
  end

  test "post create creates an article" do
    assert_difference 'Article.count' do
      post articles_path, params: { article: { title: "Hola Mundo", body: "Este es el cuerpo del articulo", published: false } }
    end

    article = Article.last
    assert_equal "Hola Mundo", article.title
    assert_equal "Este es el cuerpo del articulo", article.body
    assert_not article.published
  end

  test "post create redirects to articles list" do
    post articles_path, params: { article: { title: "Hola Mundo", body: "Este es el cuerpo del articulo", published: false } }
    assert_redirected_to article_path(Article.last)
  end
end

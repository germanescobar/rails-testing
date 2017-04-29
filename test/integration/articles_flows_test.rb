require 'test_helper'

class ArticlesFlowsTest < ActionDispatch::IntegrationTest
  test "user can create a new article" do
    Capybara.current_driver = Capybara.javascript_driver
    
    visit articles_path

    click_link "New Article"
    assert_equal new_article_path, page.current_path

    title = Faker::Lorem.sentence
    body = Faker::Lorem.paragraph

    fill_in "Title", with: title
    fill_in "Body", with: body

    click_button "Create Article"

    article = Article.where(title: title).take
    assert_not_nil article

    assert_equal article_path(article), page.current_path
  end
end

class Article < ApplicationRecord
  validates :title, presence: true

  def self.published
    where(published: true)
  end

  def word_count
    body.scan(/\w+/).size
  end
end

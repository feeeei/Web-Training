class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, :text, :category, presence: true
  validates :user, presence: true

  paginates_per 10

  def Article.all
    super.order(created_at: :desc)
  end

  def Article.current_articles current_page
    page current_page
  end
end

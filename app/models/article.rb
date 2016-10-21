class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, :text, :category, presence: true
  validates :user, presence: true

  def Article.all
    super.order(created_at: :desc)
  end
end

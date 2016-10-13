class SearchController < ApplicationController

  def index
    @articles = Article.where("title LIKE ?", "%#{params[:q]}%")
    if params[:category]
      @articles = @articles.where(category: params[:category])
    end
  end
end
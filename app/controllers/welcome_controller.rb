class WelcomeController < ApplicationController

  def index
    @articles = Article.all
    today = Time.new
    @today_updated_count = @articles.where("created_at >= ? and created_at <= ?", today.at_beginning_of_day, today.at_end_of_day).count
  end
end
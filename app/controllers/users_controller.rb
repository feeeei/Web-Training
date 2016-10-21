class UsersController < ApplicationController

  def mine
    if current_user
      @articles = current_user.article.current_articles params[:page]
    end
  end
end
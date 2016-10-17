class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :destroy]
  before_action :article_params, only: [:create]

  def new
    @article = current_user.article.new
  end

  def create
    @article = Article.new article_params
    @article.user = current_user
    if @article.save
      redirect_to mine_users_path
    else
      format.html { render :new }
      format.json { render json: @article.errors, status: :unprocessable_entity }
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @article.destroy!
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :category)
  end

  def set_article
    @article = Article.find params[:id]
  end
end
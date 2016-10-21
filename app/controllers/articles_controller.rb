class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
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

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
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
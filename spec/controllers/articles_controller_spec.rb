require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  login_user

  describe 'GET #show' do
    it 'assigns the requested article to @article' do
      article = create :article
      get :show, id: article
      expect(assigns(:article)).to eq article
    end

    it 'renders the :show template' do
      article = create(:article)
      get :show, id: article
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a new article to @article' do
      get :new
      expect(assigns(:article)).to be_a_new(Article)
    end

    it 'rengders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested article to @article' do
      article = create(:article)
      get :edit, id: article
      expect(assigns(:article)).to eq article
    end

    it 'renders the :edit template' do
      article = create (:article)
      get :edit, id: article
      expect(response).to render_template :edit
    end
  end

  describe 'POST :create' do
    it 'saves the new article in the database' do
      expect {
        post :create, article: attributes_for(:article)
      }.to change(Article, :count).by(1)
    end

    it 'redirects to users#mine' do
      post :create, article: attributes_for(:article)
      expect(response).to redirect_to mine_users_path
    end
  end

  describe 'PATCH #update' do
    it 'locates the requested @article' do
      @article = create(:article)
      patch :update, id: @article, article: attributes_for(:article)
      expect(assigns(:article)).to eq @article
    end
  end

  describe 'DELETE @destory' do
    before :each do
      @article = create(:article)
    end

    it 'deletes the article' do
      expect {
        delete :destroy, id: @article, format: :js
      }.to change(Article, :count).by(-1)
    end
  end

end

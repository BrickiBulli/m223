class ArticlesController < ApplicationController
  before_action :require_login
  before_action :set_article, only: [:edit, :update, :show, :destroy]  

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def edit
 
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: 'Article was successfully deleted.'
  end

  private

  def set_article
    @article = Article.find(params[:id])  
  rescue ActiveRecord::RecordNotFound
    redirect_to articles_path, alert: "Article not found."  
  end

  def article_params
    params.require(:article).permit(:name, :article_number, :article_text, :weight)
  end
end

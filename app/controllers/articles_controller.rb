class ArticlesController < ApplicationController
  def index
    @category = Category.find_by(id: params[:category_id])
  end

  def show
    @article = Article.find_by(id: params[:id])
    @category = @article.category
  end

  def new
    @category = Category.find_by(id: params[:category_id])
    @article = @category.articles.new()
  end

  def create
    @category = Category.find_by(id: params[:category_id])
    @article = @category.articles.new(article_params)
    if @article.save
      redirect_to category_article_url(@category, @article)
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find_by(id: params[:id])
    @category = @article.category
  end

  private

  def article_params
    params.require(:article).permit(:title, :email, :price, :zip_code, :description)
  end
end

class ArticlesController < ApplicationController
  def index
    @category = Category.find_by(id: params[:category_id])
  end

  def create
    @category = Category.find_by(id: params[:category_id])
    @article = @category.articles.new(article_params)
    if @article.save
      session[:edit_code] = @article.edit_id
      redirect_to category_article_url(@category, @article)
    else
      render 'new'
    end
  end

  def new
    @category = Category.find_by(id: params[:category_id])
    @article = @category.articles.new()
  end

  def show
    @article = Article.find_by(id: params[:id])
    @category = @article.category
  end

  def update
    @article = Article.find_by(id: params[:id])

    if @article.update(article_params)
      redirect_to category_article_url(@article.category, @article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    @article.destroy
    redirect_to root_path
  end

  def edit
    @article = Article.find_by(id: params[:id])
    @category = @article.category
    if @article.edit_id != params[:code]
      redirect_to category_article_url(@category, @article)
    else
      render 'edit'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :email, :price, :zip_code, :description)
  end
end

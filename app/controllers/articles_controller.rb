class ArticlesController < ApplicationController
  def index
    @category = Category.find_by(id: params[:category_id])
  end

  def show
    @article = Article.find_by(id: params[:id])
    @category = @article.category
  end
end

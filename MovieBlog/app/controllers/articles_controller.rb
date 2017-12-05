# Tutorial Controller by Kumamon
class ArticlesController < ApplicationController
  # Show all articles
  def index
    @articles = Article.all
  end

  # Show one article they are beeing found by ID parameter
  # and beeing shown in app/views/articles/show.html.erb
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  # Creating a new article with parameters Text and
  # Title placed and permited in private article_params
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end

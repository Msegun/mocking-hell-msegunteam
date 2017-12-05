class ArticlesController < ApplicationController
  # Show all articles
  def index
    @articles = Article.all
  end

  # Show one article they are beeing found by ID parameter and beeing shown in app/views/articles/show.html.erb
  def show
    @article = Article.find(params[:id])
  end

  def new
     @article = Article.new
  end

  # Creating a new article with parameters Text and Title placed and permited in private article_params
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  private
  def article_params
      params.require(:article).permit(:title, :text)
  end
end

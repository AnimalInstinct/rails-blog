class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      # render plain: @article.inspect
      flash[:success] = "Article successfully created"
      # redirect_to article_path(@article)
      redirect_to @article
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:success] = "Article was successfully updated"
      redirect_to @article
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end
end

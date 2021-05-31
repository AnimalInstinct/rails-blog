class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
  end
  def new
  end
  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:success] = "Object successfully created"
      # render plain: @article.inspect
      redirect_to @article
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
end

class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  def show
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article successfully created"
      redirect_to @article
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  def edit
  end
  def update
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to @article
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end
  def destroy
    if @article.destroy
      flash[:success] = 'Article was successfully deleted.'
      redirect_to articles_url
    else
      flash[:danger] = 'Something went wrong'
      redirect_to articles_url
    end
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end
  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end
  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = ' You can edit or delete only your articles.'
      redirect_to @article
    end
  end
end

class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authorized, except: [:index, :show]
  before_action :owner?, only: [:edit, :destroy]

  def index
    @articles = Article.all
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
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, status: :see_other, notice: "Article was successfully destroyed."
  end

  #######
  private
  #######

  def set_article
    @article=Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :user_id)
  end

  def owner?
    unless current_user == @article.user
      redirect_back fallback_location: root_path, alert: 'User is not owner'
    end
  end

end
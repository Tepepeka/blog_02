class CommentsController < ApplicationController

  before_action :authorized
  before_action :owner?, only: [:destroy]

  def create
    @article = Article.find(params[:article_id])

    @comment = @article.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to article_path(@article), notice: "Comment was successfully created."
    else
      redirect_to article_path(@article), alert: "Comment was not created."
    end

  end


  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other, notice: "Comment was successfully destroyed."
  end

  #######
  private
  #######

  def comment_params
    params.require(:comment).permit(:body)
  end

end
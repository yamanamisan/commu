class CommentsController < ApplicationController
   before_action :login_required, except: [:index, :show]


  def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new(params_comment)
    @comment.article = @article

    if @comment.save
      redirect_to article_url(@article)
    else
      render "articles/show"
    end
  end


  private

  def params_comment
    params.require(:comment).permit(:name,:content)
  end
end

class ArticlesController < ApplicationController
   before_action :login_required, except: [:index,:show]
 def index
   @articles = Article.all
   .page(params[:page]).per(25)
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

 def new
   @article = Article.new
  end

  def create
  @article = Article.new(article_params)
  if @article.save
    redirect_to @article, notice: "スレッドを立てました"
  else
    render "new"
  end
end

def edit
  @article = Article.find(params[:id])
end

def update
  @article = Article.find(params[:id])
  if @article.update_attributes(params_article)
    redirect_to article_url(@article)
  else
    render "edit"
  end
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
  redirect_to articles_url
end

private

def article_params
  params.require(:article).permit(:title,:editor)
end

end

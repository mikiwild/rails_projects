class ArticlesController < ApplicationController
  before_action :set_article, only:[:edit,:update, :show, :destory]
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
    if @article.save
      flash[:notice] = "article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end
  
  def show 
   
  end
  
  def edit
    
  end
  
  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render'edit'
    end
  end
  
  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted"
    redirect_to article_path
  end
  
  private
  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
  
end
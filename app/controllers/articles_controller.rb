class ArticlesController < ApplicationController

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.update_attribute(:total_bets, 0)
    @article.update_attribute(:creator_id, params[:creator_id])

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def bet_yes
    @article = Article.find(params[:article_id])
    @article.update_attribute(:total_bets, @article.total_bets + @article.min_bet)
    redirect_to @article
  end

  def bet_no
    @article = Article.find(params[:article_id])
    @article.update_attribute(:total_bets, @article.total_bets + @article.min_bet)
    redirect_to @article
  end

  private
    def article_params
        params.require(:article).permit(:title, :min_bet)
    end

end

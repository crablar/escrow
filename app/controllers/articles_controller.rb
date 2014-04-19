class ArticlesController < ApplicationController

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.update_attribute(:total_bets, 0)

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
    @article.update_attribute(:total_bets, @article.total_bets + @article.min_bet)
  end

  private
    def article_params
        params.require(:article).permit(:title, :min_bet)
    end

end

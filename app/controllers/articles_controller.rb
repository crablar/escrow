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

  #because yes
  def bet_yes
    @article = Article.find(params[:article_id])
    @active_user = User.find(params[:active_user_id])
    if(@active_user.balance - @article.min_bet >= 0)
      @active_user.update_attribute(:balance, @active_user.balance - @article.min_bet)
      @article.update_attribute(:yes_bet_total, @article.yes_bet_total + @article.min_bet)
      @article.update_attribute(:total_bets, @article.total_bets + @article.min_bet)
    end
    redirect_to @article
  end

  def bet_no
    @article = Article.find(params[:article_id])
    @active_user = User.find(params[:active_user_id])
    if(@active_user.balance - @article.min_bet >= 0)
      @active_user.update_attribute(:balance, @active_user.balance - @article.min_bet)
      @article.update_attribute(:no_bet_total, @article.no_bet_total + @article.min_bet)
      @article.update_attribute(:total_bets, @article.total_bets + @article.min_bet)
    end
    redirect_to @article
  end

  private
    def article_params
        params.require(:article).permit(:title, :min_bet, :time_to_expiration)
    end


end

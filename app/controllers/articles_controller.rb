class ArticlesController < ApplicationController

  def new
  end

  def create
    @article = Article.new(article_params)
    @article.update_attribute(:total_bets, 0)
    @article.update_attribute(:creator_id, params[:creator_id])
    @article.update_attribute(:expired, false)
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
    check_expiration(@article)
    @active_user = User.find(params[:active_user_id])
    @bet = Bet.new
    @bet.update_attribute(:user_id, params[:active_user_id])
    @bet.update_attribute(:article_id, @article.id)
    @bet.update_attribute(:is_yes, true)
    if(@active_user.balance - @article.min_bet >= 0)
      @active_user.update_attribute(:balance, @active_user.balance - @article.min_bet)
      @article.update_attribute(:yes_bet_total, @article.yes_bet_total + @article.min_bet)
      @article.update_attribute(:total_bets, @article.total_bets + @article.min_bet)
    end
    redirect_to @article
  end

  def bet_no
    @article = Article.find(params[:article_id])
    check_expiration(@article)
    @active_user = User.find(params[:active_user_id])
    @bet = Bet.new
    @bet.update_attribute(:user_id, params[:active_user_id])
    @bet.update_attribute(:article_id, @article.id)
    @bet.update_attribute(:is_yes, false)
    if(@active_user.balance - @article.min_bet >= 0)
      @active_user.update_attribute(:balance, @active_user.balance - @article.min_bet)
      @article.update_attribute(:no_bet_total, @article.no_bet_total + @article.min_bet)
      @article.update_attribute(:total_bets, @article.total_bets + @article.min_bet)
    end
    redirect_to @article
  end

  def check_expiration(article)
    expired = DateTime.current.to_i - article.created_at.to_i > article.time_to_expiration
    if(expired)
      article.update_attribute(:expired, true)
      distribute_winnings(article)
    end
  end

  private
    def article_params
        params.require(:article).permit(:title, :min_bet, :time_to_expiration)
    end

    def distribute_winnings(article)

    end

end

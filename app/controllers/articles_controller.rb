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
    check_expiration(@article)
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
    Rails.logger.debug("debug::" + @article.to_s)
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
    if(expired && !article.expired)
      article.update_attribute(:expired, true)
      if(article.yes_bet_total > article.no_bet_total)
        article.update_attribute(:winning_side, "yes")
      end
      if(article.yes_bet_total < article.no_bet_total)
        article.update_attribute(:winning_side, "no")
      end
      distribute_winnings(article)
    end
  end

  private
    def article_params
        params.require(:article).permit(:title, :min_bet, :time_to_expiration)
    end

    def distribute_winnings(article)
      Rails.logger.debug("debug:: article id" + article.article_id)
      Rails.logger.debug("debug:: user id" + article.user_id)
      if(article.winning_side == ("yes"))
        number_of_winning_bets = article.yes_bet_total / article.min_bet
        winnings_per_winner = article.no_bet_total / number_of_winning_bets
      else
        number_of_winning_bets = article.no_bet_total / article.min_bet
        winnings_per_winner = article.yes_bet_total / number_of_winning_bets
      end
      Bet.where(:article_id => params[:article_id]).each do |bet|
        is_winning_bet = (bet.is_yes and article.winning_side == "yes") or (!bet.is_yes and article.winning_side == "no")
        if(article.winning_side == "draw" or is_winning_bet)
          user_id = bet.user_id
          Rails.logger.debug("debug::" + user_id)
          @user = User.find(user_id)
          @user.update_attribute(:balance, @user.balance + winnings_per_winner)
        end
      end
    end

end

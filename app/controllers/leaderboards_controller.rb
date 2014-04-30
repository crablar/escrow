class LeaderboardsController < ApplicationController

  def index
    @users = User.all().sort_by{ |user| user.balance}.reverse
  end

end

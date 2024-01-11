class UsersController < ApplicationController
  def my_portfolio
    if user_signed_in?
      @tracked_stocks = current_user.stocks
    else
      @tracked_stocks = []
    end
  end
end

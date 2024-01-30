class UsersController < ApplicationController
  def my_portfolio
    if user_signed_in?
      @tracked_stocks = current_user.stocks
    else
      @tracked_stocks = []
    end
  end

  def my_friends
    @friends = current_user.friends
  end

  def search
    if params[:friend].present?
      @friend = params[:friend]
      if @friend
        render turbo_stream: turbo_stream.replace('results_turbo_stream', partial: 'friends/result')
        else 
            flash.now[:alert] = "Please enter a valid symbol to search"
            render turbo_stream: turbo_stream.replace('results_turbo_stream', partial: 'friends/result')
        end
    else
        flash.now[:alert] = "Please enter a symbol to search"
        render turbo_stream: turbo_stream.replace('results_turbo_stream', partial: 'friends/result')
    end
  end
end

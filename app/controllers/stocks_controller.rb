class StocksController < ApplicationController
    def search
        if params[:stock].present?
            @stock = Stock.new_lookup(params[:stock])

            if @stock
                render turbo_stream: turbo_stream.replace('results_turbo_stream', partial: 'users/result')
            else 
                flash.now[:alert] = "Please enter a valid symbol to search"
                render turbo_stream: turbo_stream.replace('results_turbo_stream', partial: 'users/result')
            end
        else
            flash.now[:alert] = "Please enter a symbol to search"
            render turbo_stream: turbo_stream.replace('results_turbo_stream', partial: 'users/result')
        end
    end
end
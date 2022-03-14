class PurchasesController < ApplicationController
    before_action :find_game
    before_action :authenticate_user!, only:[:new, :create]


    def new
        @purchase = Purchase.new
    end

    def create
        Purchase.create(game: @game, user: current_user, price: @game.price)
        redirect_to game_path(@game.id)
    end

    def find_game
        @game = Game.find(params[:game_id])
    end

end

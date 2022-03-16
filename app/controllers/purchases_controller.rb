class PurchasesController < ApplicationController
    before_action :find_game
    before_action :authenticate_user!

    def index
        @purchase = current_user.purchases
    end

    def new
        @purchase = Purchase.new
    end

    def create
        @amount = (@game.price*100).to_i
        customer = Stripe::Customer.create(
            email: params[:stripeEmail],
            source: params[:stripeToken]
        )

        charge = Stripe::Charge.create(
            customer: customer.id,
            amount: (@game.price*100).to_i,
            description: "#{@game.name} payment",
            currency: 'aud'
        )

        @purchase = Purchase.create(game: @game, user: current_user, price: @game.price)
        redirect_to game_path(@game.id)

        rescue Stripe::CardError => e
            flash[:error] = e.message

        redirect_to game_path(@game.id)
    end

    def find_game
        @game = Game.find(params[:game_id])
    end

end

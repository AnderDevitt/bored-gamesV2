class PurchasesController < ApplicationController
    
    before_action :find_purchase, only: %i[show edit update destroy ]
    before_action :find_game, only: [:new, :create ]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :check_ownership, only: [:edit, :update, :destroy]

    def index
        @purchases = current_user.purchases
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
        begin
        @purchase = Purchase.create(game: @game, user: current_user, price: @game.price, receipt_url: charge.receipt_url)
        # redirect_to game_path(@game.id)

        rescue Stripe::CardError => e
            puts e.message
            # redirect_to_games_path(@game.id), alert: "Payment failed" 
        end
        # redirect_to game_path(@game.id)
    end

    private

    def find_game
        @game = Game.find(params[:game_id])
    end

    def find_purchase
        @purchase = Purchase.find(params[:purchase_id])
    end

    def check_ownership
        if !(current_user.admin? or current_user.id == @purchase.user_id)
          redirect_to games_url, alert: "You have to be the seller of a game or an admin to do this."
        end
      end
end

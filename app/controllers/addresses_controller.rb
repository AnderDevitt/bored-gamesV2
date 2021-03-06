class AddressesController < ApplicationController
    before_action :set_address, only: %i[ show edit update destroy ]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :check_ownership, only: [:show, :edit, :update, :destroy]

    # GET /addresses
    def index
        @addresses = Address.all
    end

    # GET /addresses/1
    def show
        @address = Address.find(params[:id])
    end

    # GET /addresses/new
    def new
        @address = Address.new
    end

    # GET /addresses/1/edit
    def edit
    end

    # POST /games
    def create
        begin
            # Ensure correct params are passed
            Address.new(street_number: address_params[:street_number], street_name: address_params[:street_name], suburb: address_params[:suburb], state: address_params[:state], postcode: address_params[:postcode], user: current_user)
            # No redirect here as address is created together with User creation in Devise
        rescue StandardError => e
            puts e.message
            redirect_to games_path, notice: "Address wasn't created"
        end  
    end

    # PATCH/PUT /addresses/1
    def update
        respond_to do |format|
            if @address.update(address_params)
                format.html { redirect_to game_url, notice: "Address was successfully updated." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
        begin
            @address = Address.find(params[:id])
        rescue StandardError => e
            puts e.message
            redirect_to games_path, alert: "Application is trying to access an address id #{params[:id]} doesn't exist in the database"
        end
    end

    # Only allow a list of trusted parameters through.
    def address_params
        params.require(:address).permit(:street_number, :street_name, :suburb, :state, :postcode)
    end

    # Only allow admin or address owner to do select actions
    def check_ownership
        if !(current_user.admin? or current_user.id == @address.user_id)
          redirect_to games_url, alert: "You have to be the authorised user or an admin to do this."
        end
    end
end

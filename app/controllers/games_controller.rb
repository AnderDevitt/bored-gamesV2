class GamesController < ApplicationController
    before_action :find_game, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_ownership, only: [:edit, :update, :destroy]

  # GET /games
  def index
    @games = Game.all
  end

  # GET /games/1
  def show
    # @game = Game.find(params[:id])
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  def create
    # @game = Game.new(game_params, user_id: current_user.user_id)
    # @game = Game.new(name: game_params[:name], condition: game_params[:condition], minimum_players: game_params[:minimum_players], maximum_players: game_params[:maximum_players], price: game_params[:price], description: game_params[:description], genre: game_params[:genre], picture: game_params[:picture], user: current_user)
    begin
      game = Game.create(game_params)
      redirect_to games_path, notice: "#{game.name} was created successfully"
    rescue StandardError => e
      puts e.message
      redirect_to games_path, notice: "#{game.name} wasn't created"
    end
    # respond_to do |format|
      # if @game.save
      #   format.html { redirect_to games_url(@game), notice: "Game was successfully created." }
      # else
      #   format.html { render :new, status: :unprocessable_entity }
      # end
  end

  # PATCH/PUT /games/1
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to games_url(@game), notice: "Game was successfully updated." }
  
      else
        format.html { render :edit, status: :unprocessable_entity }
        
      end
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
    puts "destroy"
    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_game
      begin
        @game = Game.find(params[:id])
      rescue StandardError => e
        puts e.message
        redirect_to games_path, alert: "This game id #{params[:id]} doesn't exist in the database"
      end
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:name, :condition, :minimum_players, :maximum_players, :price, :description, :genre, :picture)
    end

    def check_ownership
      if !(current_user.admin? or current_user.id == @game.user_id)
        redirect_to games_url, alert: "You have to be the seller of a game or an admin to do this."
      end
    end
end

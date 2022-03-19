class GamesController < ApplicationController
    before_action :find_game, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_ownership, only: [:edit, :update, :destroy]

  # GET /games
  def index
    @games = Game.all
  end

  # GET /search
  def search
    if params[:search].blank?
      redirect_to games_path and return
    else
        @parameter = params[:search].downcase
        @results = Game.all.where("lower(name) LIKE :search", search: "%#{@parameter}%")
    end
  end

  # GET /games/1
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # def create
  #   begin
  #     game = current_user.games.create(game_params)
  #     redirect_to game_path(game), notice: "#{game.name} was created successfully"
  #   rescue StandardError => e
  #     puts e.message
  #     redirect_to games_path, notice: "#{game.name} wasn't created"
  #   end
  # end
  def create
    begin
      game = current_user.games.create(game_params)
      redirect_to game_path(game), notice: "#{game.name} was created successfully"
    rescue StandardError => e
      puts e.message
      redirect_to games_path, notice: "Game wasn't created"
    end
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
      params.require(:game).permit(:name, :condition, :minimum_players, :maximum_players, :price, :description, :genre, :picture, :search)
    end

    # Only allow admin or game seller to do select actions
    def check_ownership
      if !(current_user.admin? or current_user.id == @game.user_id)
        redirect_to games_url, alert: "You have to be the seller of a game or an admin to do this."
      end
    end
end

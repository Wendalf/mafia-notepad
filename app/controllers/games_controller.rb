class GamesController < ApplicationController
  before_action :authenticate_user! 

  def index
    @games = current_user.games
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @games}
    end
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(strong_params)
    redirect_to edit_game_path(@game)
  end

  def show
    @game = Game.find(params[:id])
    @night = Night.new
  end

  def edit
    @game = Game.find(params[:id])
    @game.capacity.times do
      @game.players.build
    end 
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to game_path(@game)
  end

  
  private

  def strong_params
    params.permit(:user_id, :capacity)
  end

  def game_params
    params.require(:game).permit(players_attributes: [:name, :character_id])
  end

end

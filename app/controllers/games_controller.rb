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
    @game = Game.create(game_params)
    redirect_to @game 
  end

  def show
    @game = Game.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @game}
    end
  end

  def edit

  end

  def update

  end

  
private
  def game_params
    params.permit(:user_id, :capacity)
  end
end

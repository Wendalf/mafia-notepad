class NightsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_game, only: [:create, :show, :update]
  before_action :find_night, only: [:show, :update]

  def create
    @night = Night.new(game_id: @game.id, logs: "", notes: "")
    got_blocked = DetermineDeath.gotblocked(params[:night_events])
    got_killed = DetermineDeath.gotkilled(params[:night_events], @night, got_blocked)
    DetermineDeath.death_and_notes(got_killed, @night)

    @night.save
    game_end?

    respond_to do |format|
      format.html {redirect_to game_path(@game)}
      format.json {render json: @game}
    end
  end

  def update
    player_id = params[:day_event][:executed]

    if player_id == ""
      @night.notes << "No body got executed by votes.<br>"
    else
      player = Player.find(player_id)
      player.update(alive: false)
      @night.notes << "#{player.name} has been executed by votes.<br>"
    end
    
    @night.save
    game_end?

    respond_to do |format|
      format.html {redirect_to game_path(@game)}
      format.json {render json: @game}
    end
  end 

  def show
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @night}
    end
  end

  private

  def find_game
    @game = Game.find_by(id: params[:game_id])
  end

  def find_night
    @night = @game.nights.find_by(id: params[:id])
  end

  def game_end?
    if Player.alive_mafia_number(@game) == 0
      @game.update(game_status: "good_people")
    elsif Player.alive_mafia_number(@game) >= Player.alive_good_people_number(@game)
      @game.update(game_status: "mafia")
    end
  end
end

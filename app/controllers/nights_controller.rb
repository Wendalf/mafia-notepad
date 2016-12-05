class NightsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_game, only: [:create, :show, :update]
  before_action :find_night, only: [:show, :update]
  # before_action :game_end?, only: [:show, :new]

  def create
    @night = Night.new(game_id: @game.id, logs: "", notes: "")
    got_blocked = DetermineDeath.gotblocked(params[:night_events])
    got_killed = DetermineDeath.gotkilled(params[:night_events], @night, got_blocked)
    DetermineDeath.death_and_notes(got_killed, @night)

    @night.save
    redirect_to game_night_path(@game, @night)
  end

  def update

  end 

  def show

  end

  private

  def find_game
    @game = Game.find_by(id: params[:game_id])
  end

  def find_night
    @night = @game.nights.find_by(id: params[:id])
  end

end

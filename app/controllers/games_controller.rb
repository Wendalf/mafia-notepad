class GamesController < ApplicationController
  before_action :authenticate_user! 

  def index

  end

  def new

  end

  def create

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

end

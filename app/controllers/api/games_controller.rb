class Api::GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    render json: @game
  end

  def index
    @games = Game.all
    render json: @games
  end
end

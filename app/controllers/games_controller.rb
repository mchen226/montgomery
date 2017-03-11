class GamesController < ApplicationController
  def show
  end

  def index
    @games = Game.all
    render json: @games
  end
end

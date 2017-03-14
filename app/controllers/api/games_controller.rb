class Api::GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
    render json: @game
  end

  def index
    page = (params[:page] || 1).to_i 
    per_page = (params[:per_page] || 100).to_i

    @games = Game.limit(per_page).offset((page - 1)*per_page)
    render json: @games
  end
end

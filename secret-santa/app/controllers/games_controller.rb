class GamesController < ApplicationController
  validates :player_number, numericality: { greater_than: 0, integer_only: true }
  def show
    @game = Game.find(params[:id])
  end

  def index
    @games = Game.all
  end
  
  def new
  end

  def create
    @game = Game.new(game_params)
    @game.save
    redirect_to @game
  end

  private
    def game_params
      params.require(:game).permit(:player_number)
    end
end

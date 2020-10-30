
class CardsController < ApplicationController
  def new
    board = Board.find(params[:board_id])
    @card = board.cards.build
  end

  def create
    board = Board.find(params[:board_id])
    @card = board.cards.build(card_params)
    if @card.save
      redirect_to board_path(board), notice: 'カードを追加'
    else
      flash.now[:error] = '更新できませんでした'
      render :new
    end
  end

  private
  def card_params
    params.require(:card).permit(:title, :content)
  end
end
class BoardsController < ApplicationController
  before_action :set_article, only: [:edit, :update]
  
  def index
    @boards = Board.all
  end

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to root_path(@board), notice: '保存できたよ'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
    @cards = @board.cards
  end

  def edit
  end

  def update
    if @board .update(board_params)
      redirect_to board_path(@board), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy!
    redirect_to root_path, notice: '削除しました'
  end

  private
  def board_params
    params.require(:board).permit(:title, :content)
  end

  def set_article
    @board = current_user.boards.find(params[:id])
  end
end
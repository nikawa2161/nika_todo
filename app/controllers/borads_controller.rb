class BoradsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end
end
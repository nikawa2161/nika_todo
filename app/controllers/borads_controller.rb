class BoradsController < ApplicationController
  def index
    @boards = Board.all
  end
end
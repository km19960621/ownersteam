class PositionsController < ApplicationController
  def index
    @positions = Position.all
  end

  def new
    @position = Position.new
  end

  def create
    @position = Position.new(position_params)
    if @position.save
      redirect_to positions_path
    else
      render :new
    end
  end

  private
  def position_params
    params.require(:position).permit(:name)
  end
end

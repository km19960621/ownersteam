class CardsController < ApplicationController
  before_action :login_required

  def index
    @cards = Card.page(params[:page]).per(CARD_NUM).order(:image_front)
  end

  def new
    @card = Card.new
  end

  def create
    @card = current_user.cards.new(card_params)
    if @card.save!
      redirect_to "/users/#{@card.user.id}/cards", success: 'カードを登録しました'
    else
      flash.now[:danger] = "カードの登録に失敗しました"
      render :new
    end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    card = Card.find(params[:id])
    card.update!(card_params)
    redirect_to "/users/#{card.user.id}/cards", notice: "更新しました"
  end

  def destroy
    card = Card.find(params[:id])
    order = Order.find_by(card_id: card.id)
    card.destroy
    order.destroy
    redirect_to "/users/#{card.user.id}/cards", notice: "削除しました"
  end

  private
  def card_params
    params.require(:card).permit(:image_front, :image_back, :name)
  end
end

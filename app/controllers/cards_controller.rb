class CardsController < ApplicationController
  before_action :login_required

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
    redirect_to "/users/#{card.user.id}/cards", success: "カードの情報を更新しました"
  end

  def destroy
    card = Card.find(params[:id])
    card.destroy
    redirect_to "/users/#{card.user.id}/cards", success: "カードを削除しました"
  end

  private
  def card_params
    params.require(:card).permit(:image, :name)
  end
end

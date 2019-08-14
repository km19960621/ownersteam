class OrdersController < ApplicationController
  before_action :login_required, except: [:index, :show]

  def index
    @orders = Order.page(params[:page]).per(ORDER_NUM).order(created_at: "DESC")
  end

  def new
    @order = Order.new
    @order.players.build
  end

  def create
    @order = current_user.orders.new(order_params)
    if @order.save!
      redirect_to orders_path, success: 'オーダーを作成しました'
    else
      flash.now[:danger] = "オーダーの作成に失敗しました"
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
    @user = @order.user
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.update!(order_params)
    redirect_to "/users/#{order.user.id}", success: "オーダーを更新しました"
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to "/users/#{order.user.id}", success: "オーダーを削除しました"
  end

  private
  def order_params
    params.require(:order).permit(:title, players_attributes: [:position_id, :card_id])
  end
end

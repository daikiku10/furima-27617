class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :cheak_user, only: :index

  def index
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(form_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def form_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def cheak_user
    item = Item.find(params[:item_id])
    if current_user.id == item.user_id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: form_params[:token],
      currency: 'jpy' 
    )
  end
end

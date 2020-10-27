class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  private
  def item_params
    params.require(:item).permit(:name, :explain, :category_id, :status_id, :delivery_burden_id, :delivery_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end

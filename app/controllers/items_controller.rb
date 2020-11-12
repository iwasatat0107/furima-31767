class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    
    if @item.valid? 
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :postage_pay_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
  
end

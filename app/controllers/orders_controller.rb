class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:post_code, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end


# １購入ぼたんを押す
# ｜
# ２：def index
#   @item  = ****
#   @user_order = *****
# |
# 3 :index.html.erb
#   @user_order = *****
# |
# 4入ぼたんを押す
# |
# def create
 

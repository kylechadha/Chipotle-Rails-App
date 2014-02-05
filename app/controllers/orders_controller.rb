class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      flash[:notice] = "Successfully submitted order!"
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:type, :cheese, meat: [])
  end

end

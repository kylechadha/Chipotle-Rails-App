class OrdersController < ApplicationController
  before_filter :login_required, only: [:destroy]

  def index
    @orders = Order.all
    # if params[:show] == "completed"
    #   @orders = Order.where(is_completed: true)
    # elsif params[:show] == "all"
    #   @orders = Order.all
    # else
    #   @orders = Order.where(is_completed: false)
    # end
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to action: 'index'
      flash[:notice] = "Successfully submitted order!"
    else
      render action: 'new'
    end
  end

  def update
    @order = Order.find(params[:id])

    if @order.update(order_params)
      redirect_to action: 'index'
      flash[:notice] = 'Order was successfully updated!'
    else
      render action: 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to action: 'index'
  end

  private
  def order_params
    params.require(:order).permit(:type, :cheese, meat: [])
  end

end

class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user)
  end

  def show
    @order = Order.find(params[:id])
      #@calculations = Calculation.find(params[:id])
  end

  def new
    @order = current_user.orders.build
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      flash[:notice] = "Order Created Successfully."
      redirect_to(action: :index)
    else
      render 'new'
    end
  end
  
  def edit
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update_attributes(order_params)
      flash[:notice] = "Order Updated Successfully."
      redirect_to(action: 'show', :id => @order.id)
    else
      render 'edit'
    end
  end
  
  def delete
    @order = Order.find(params[:id])
  end

  def destroy
    order = Order.find(params[:id]).destroy
    flash[:notice] = "Order '#{order.name}' Destroyed Successfully."
    redirect_to(:action => "index")
  end

  private

  def order_params
    params.require(:order).permit(:name, :description)
  end
end

class CalculationsController < ApplicationController
  def index
    @calculations = Calculation.where(user_id: current_user)
  end

  def show
    @calculation = Calculation.find(params[:id])
  end

  def new
    @calculation = current_user.calculations.build
  end

  def create
    @calculation = current_user.calculations.build(calculation_params)
    if @calculation.save
      redirect_to :action => "index"
    else
      render 'new'
    end
  end

  def edit
    @calculation = Calculation.find(params[:id])
  end

  def update
    @calculation = Calculation.find(params[:id])
    if @calculation.update_attributes(calculation_params)
      redirect_to :action => 'index'
    else
      render 'edit'
    end
  end

  def delete
    @calculation = Calculation.find(params[:id])
  end

  def destroy
    calculation = Calculation.find(params[:id]).destroy
    redirect_to :action => 'index'  
  end

  private
  def calculation_params
    params.require(:calculation).permit(:name, :order_id, :price, :quantity, :total)
  end
end

class RentalsController < ApplicationController
  def new
    @rental = Rental.new
    @item = Item.find(params[:item_id])
  end

  def create
    @rental = Rental.new(rental_params)
    @item = Item.find(params[:item_id])
    @rental.item = @item
    @rental.save
    flash[:notice] = "Congratulations on renting a tool from the pool!"
    redirect_to item_path(@item)
  end

 private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :item_id)
  end


end

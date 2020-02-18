class RentalsController < ApplicationController

  def new
    @rental = Rental.new
    @item = Item.find(params[:item_id])
  end

end


class RentalsController < ApplicationController

  def create
    @rental = Rental.new(rental_params)
    @item = Item.find(params[:item_id])
    @user = current_user
    @rental.item_id = @item.id
    @rental.user_id = @user.id

    if @rental.save
      flash[:notice] = "Congratulations on renting a tool from the pool!"
      redirect_to success_item_path(@item)
    else
      flash[:alert] = "Sorry, this tool is already booked for this period of time."
      render 'items/show'
    end
  end

  def destroy
    @user = current_user
    @rental = Rental.find(params[:id])
    @rental.destroy
    @my_tools = current_user.items
    @my_rentals = current_user.rentals
    redirect_to dashboard_path(@user, @my_rentals, @my_tools)
  end

 private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :item_id)
  end
end

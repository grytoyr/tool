class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end


  def rent
  # define the item
  # get the dates
  # assign it to the current_user
  # update the status of item as unavaiable
  end


  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to @item
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :category, :price, :description, :photo)
  end
end

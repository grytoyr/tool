class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current.user
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end

    private

    def items_params
      params.require(:item).permit(:name, :category, :price, :description)

       params.require(:cocktail).permit(:name, :image, :doses_id, :ingredients_id, :photo)
    end
end

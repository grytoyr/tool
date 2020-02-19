class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: [:index]

  def index
    @items = Item.all.where('address LIKE ?', '%Oslo%')

    @items_map = @items.geocoded #returns flats with coordinates

    @markers = @items_map.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def new
    @item = Item.new
  end

  def show
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
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category, :price, :description, :photo)
  end
end

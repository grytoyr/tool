class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: [:index]

  def index
    @items = Item.all.where('address LIKE ?', '%Oslo%').order(updated_at: :desc)

    @items_map = @items.geocoded #returns flats with coordinates

    @markers = @items_map.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude,
        infoWindow: render_to_string(partial: "shared/map_popup", locals: { item: item })
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

  def dashboard
    # @user = current_user
    # @user_items = current_user.items
    # @rented_items = current_user.items.rentals
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category, :price, :description, :photo)
  end
end

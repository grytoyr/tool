class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :success]

  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:query].present?
      items = Item.all.order(created_at: :desc)
      @items = items.global_search("#{params[:query]}")
    else
      @items = Item.all.order(created_at: :desc)
    end

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
    @rental = Rental.new
  end

  def create
    @item = Item.new(item_params)
    @item.address = current_user.address
    @item.user = current_user
    @item.address = current_user.address
    if @item.save
      flash[:notice] = "Congratulations, you added a new tool to the Pool!"
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "Cool, you've updated your tool! "
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      flash[:notice] = "Your tool is no longer in our pool."
      redirect_to dashboard_path
    else
      @message = @item.errors.messages.first[1].join
      flash[:alert] = "#{@message}"
      redirect_to dashboard_path
    end
  end

  def dashboard
    @user = current_user
    @my_tools = current_user.items
    @my_rentals = current_user.rentals
    # @rented_items = current_user.items.rentals
  end

  def success
    @rental = @item.rentals.last
    @days = (@rental.end_date.to_date - @rental.start_date.to_date).to_i + 1
    @owner = @rental.user.first_name
    @price = @days * @item.price
    @user = current_user.first_name
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :category, :price, :description, :photo)
  end
end

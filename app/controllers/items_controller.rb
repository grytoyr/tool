class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :success]

  skip_before_action :authenticate_user!, only: [:index]

  def index

    if params[:query].present?
      @items = Item.global_search("#{params[:query]}")
    else
      @items = Item.all
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
    @item.user = current_user
    if @item.save
      flash[:notice] = "Congratulations, you added a new tool to the Pool!"
      redirect_to @item
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "Cool, you've updated your tool! "
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      if @item.errors
        @message = @item.errors.full_message
        flash[:notice] = "#{@message}"
        redirect_to dashboard_path
      else
        @message = "something went wrong here"
      end
      redirect_to dashboard_path
      flash[:notice] = "Your tool is no longer in our pool."
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

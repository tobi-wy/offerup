class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true).includes(:user, :messages,
                                                :category).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@items.where.not(location_latitude: nil)) do |item, marker|
      marker.lat item.location_latitude
      marker.lng item.location_longitude
    end
  end

  def show
    @message = Message.new
  end

  def new
    @item = Item.new
  end

  def edit; end

  def create
    @item = Item.new(item_params)

    if @item.save
      message = "Item was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @item, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: "Item was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    message = "Item was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to items_url, notice: message
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :user_id, :photo,
                                 :location, :category_id, :price, :status)
  end
end

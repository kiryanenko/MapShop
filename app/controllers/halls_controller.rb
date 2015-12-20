require 'open-uri'
require 'nokogiri'

class HallsController < ApplicationController
  before_action :set_hall, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!, except: [:show, :index]

  # GET /halls
  # GET /halls.json
  def index
    @halls = Hall.all
  end

  # GET /halls/1
  # GET /halls/1.json
  def show
    if @hall.items_url != ''
      xml = open(@hall.items_url)
      @items = Nokogiri::XML(xml).xpath('/items/item').map do |item|
        p item
        {
            name: item.xpath('name/text()').to_s,
            description: item.xpath('description/text()').to_s,
            x: item.xpath('x/text()').to_s.to_i,
            y: item.xpath('y/text()').to_s.to_i,
            image: item.xpath('image/text()').to_s
        }
      end
    else
      @items = Item.where(hall_id: @hall.id)
      unless @items
        @items = @items.map do |item|
          {
              name: item.name,
              description: item.description,
              x: item.x,
              y: item.y,
              image: item.image.url
          }
        end
      end
    end
  end

  # GET /halls/new
  def new
    @hall = Hall.new
  end

  # GET /halls/1/edit
  def edit
  end

  # POST /halls
  # POST /halls.json
  def create
    shop_id = hall_params[:shop_id]
    if shop_id.nil? ? false : Brand.find_by_id(Shop.find_by_id(shop_id).brand_id).user_id == current_user.id
      @hall = Hall.new(hall_params)

      respond_to do |format|
        if @hall.save
          format.html { redirect_to @hall, notice: 'Hall was successfully created.' }
          format.json { render :show, status: :created, location: @hall }
        else
          format.html { render :new }
          format.json { render json: @hall.errors, status: :unprocessable_entity }
        end
      end
    else
      # неправильный shop_id
      redirect_to '/shops/index'
    end
  end

  # PATCH/PUT /halls/1
  # PATCH/PUT /halls/1.json
  def update
    hall_params = params.require(:hall).permit(:name, :description, :scale, :items_url, :map)
    respond_to do |format|
      if @hall.update(hall_params)
        format.html { redirect_to @hall, notice: 'Hall was successfully updated.' }
        format.json { render :show, status: :ok, location: @hall }
      else
        format.html { render :edit }
        format.json { render json: @hall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /halls/1
  # DELETE /halls/1.json
  def destroy
    @hall.destroy
    respond_to do |format|
      format.html { redirect_to halls_url, notice: 'Hall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hall
      @hall = Hall.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hall_params
      params.require(:hall).permit(:name, :description, :scale, :items_url, :shop_id, :map)
    end
end

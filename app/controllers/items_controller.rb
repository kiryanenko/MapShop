class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  before_filter :authenticate_user!, except: [:show, :index]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new do |i|
      i.hall_id = params[:hall_id]
    end
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    hall_id = item_params[:hall_id]
    if hall_id.nil? ? false : Brand.find_by_id(
        Shop.find_by_id(Hall.find_by_id(hall_id).shop_id).brand_id).user_id == current_user.id
      @item = Item.new(item_params)

      respond_to do |format|
        if @item.save
          format.html { redirect_to @item, notice: 'Item was successfully created.' }
          format.json { render :show, status: :created, location: @item }
        else
          format.html { render :new }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    else
      # неправильный hall_id
      redirect_to '/user/index'
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    item_params = params.require(:item).permit(:name, :description, :x, :y, :image)
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :x, :y, :hall_id, :image)
    end
end

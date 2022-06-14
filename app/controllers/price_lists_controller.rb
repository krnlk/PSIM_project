class PriceListsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_price_list, only: %i[ show edit update destroy ]

  swagger_controller :price_lists, "PriceLists"

  # GET /price_lists or /price_lists.json
  swagger_api :index do
    summary 'Returns all price lists'
  end
  def index
    @price_lists = PriceList.all
  end

  # GET /price_lists/1 or /price_lists/1.json
  swagger_api :show do
    summary 'Returns a single price list'
    param :path, :id, :integer, :required, "Price_list_id"
  end
  def show
  end

  # GET /price_lists/new
  swagger_api :new do
    summary 'Returns a view for adding a price list'
  end
  def new
    @price_list = PriceList.new
  end

  # GET /price_lists/1/edit
  swagger_api :edit do
    summary 'Returns a view for editing a price list'
    param :path, :id, :integer, :required, "Price_list_id"
  end
  def edit
  end

  # POST /price_lists or /price_lists.json
  swagger_api :create do
    summary 'Creates a price list'
    param :form, :id, :integer, :required, "Price_list_id"
    param :form, :price, :integer, :required, "Price"
    param :form, :item_type, :integer, :required, "Item_type"
    param :form, :weekday, :integer, :required, "Weekday"
    param :form, :time_from, :time, :required, "Time_from"
    param :form, :time_to, :time, :required, "Time_to"
    param :form, :current, :boolean, :required, "Current"
    notes 'Must be logged in.'
  end
  def create
    if(logged_in?)
    @price_list = PriceList.new(price_list_params)

    respond_to do |format|
      if @price_list.save
        format.html { redirect_to price_list_url(@price_list), notice: "Price list was successfully created." }
        format.json { render :show, status: :created, location: @price_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @price_list.errors, status: :unprocessable_entity }
      end
      end
    end
  end

  # PATCH/PUT /price_lists/1 or /price_lists/1.json
  swagger_api :update do
    summary 'Updates a price list'
    param :path, :id, :integer, :required, "Price_list_id"
    param :form, :id, :integer, :required, "Price_list_id"
    param :form, :price, :integer, :required, "Price"
    param :form, :item_type, :integer, :required, "Item_type"
    param :form, :weekday, :integer, :required, "Weekday"
    param :form, :time_from, :time, :required, "Time_from"
    param :form, :time_to, :time, :required, "Time_to"
    param :form, :current, :boolean, :required, "Current"
    notes 'Must be logged in.'
  end
  def update
    if(logged_in?)
    respond_to do |format|
      if @price_list.update(price_list_params)
        format.html { redirect_to price_list_url(@price_list), notice: "Price list was successfully updated." }
        format.json { render :show, status: :ok, location: @price_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @price_list.errors, status: :unprocessable_entity }
      end
      end
    end
  end

  # DELETE /price_lists/1 or /price_lists/1.json
  swagger_api :destroy do
    summary 'Destroys a price list'
    param :path, :id, :integer, :required, "Price_list_id"
    notes 'Must be logged in.'
  end
  def destroy
    if(logged_in?)
    @price_list.destroy

    respond_to do |format|
      format.html { redirect_to price_lists_url, notice: "Price list was successfully destroyed." }
      format.json { head :no_content }
    end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_list
      @price_list = PriceList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def price_list_params
      params.require(:price_list).permit(:id, :price, :item_type, :weekday, :time_from, :time_to, :current)
      #params.require(:price_list).permit(:price_list_id, :price, :item_type, :weekday, :time_from, :time_to, :current)
    end
end

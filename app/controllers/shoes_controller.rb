class ShoesController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_shoe, only: %i[ show edit update destroy ]

  swagger_controller :shoes, "Shoes"

  # GET /shoes or /shoes.json
  swagger_api :index do
    summary 'Returns all shoes'
  end
  def index
    @shoes = Shoe.all
  end

  # GET /shoes/1 or /shoes/1.json
  swagger_api :show do
    summary 'Returns a single pair of shoes'
    param :path, :id, :integer, :required, "Shoe_id"
  end
  def show
  end

  # GET /shoes/new
  swagger_api :new do
    summary 'Returns a view of a new pair of shoes'
  end
  def new
    @shoe = Shoe.new
  end

  # GET /shoes/1/edit
  swagger_api :edit do
    summary 'Returns a view of editing a pair of shoes'
    param :path, :id, :integer, :required, "Shoe_id"
  end
  def edit
  end

  # POST /shoes or /shoes.json
  swagger_api :create do
    summary 'Creates a pair of shoes'
    param :form, :id, :integer, :required, "Shoe_id"
    param :form, :size, :integer, :required, "Size"
    notes 'Must be logged in.'
  end
  def create
    if(logged_in?)
    @shoe = Shoe.new(shoe_params)

    respond_to do |format|
      if @shoe.save
        format.html { redirect_to shoe_url(@shoe), notice: "Shoe was successfully created." }
        format.json { render :show, status: :created, location: @shoe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shoe.errors, status: :unprocessable_entity }
      end
      end
    end
  end

  # PATCH/PUT /shoes/1 or /shoes/1.json
  swagger_api :update do
    summary 'Updates a pair of shoes'
    param :path, :id, :integer, :required, "Shoe_id"
    param :form, :id, :integer, :required, "Shoe_id"
    param :form, :size, :integer, :required, "Size"
    notes 'Must be logged in.'
  end
  def update
    if(logged_in?)
    respond_to do |format|
      if @shoe.update(shoe_params)
        format.html { redirect_to shoe_url(@shoe), notice: "Shoe was successfully updated." }
        format.json { render :show, status: :ok, location: @shoe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shoe.errors, status: :unprocessable_entity }
      end
      end
    end
  end

  # DELETE /shoes/1 or /shoes/1.json
  swagger_api :destroy do
    summary 'Destroys a pair of shoes'
    param :path, :id, :integer, :required, "Shoe_id"
    notes 'Must be logged in.'
  end
  def destroy
    if(logged_in?)
    @shoe.destroy

    respond_to do |format|
      format.html { redirect_to shoes_url, notice: "Shoe was successfully destroyed." }
      format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shoe
      @shoe = Shoe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shoe_params
      #params.require(:shoe).permit(:shoe_id, :size)
      params.require(:shoe).permit(:id, :size)
    end
end

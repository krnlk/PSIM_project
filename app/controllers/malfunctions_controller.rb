class MalfunctionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_malfunction, only: %i[ show edit update destroy ]

  swagger_controller :malfunctions, "Malfunctions"

  # GET /malfunctions or /malfunctions.json
  swagger_api :index do
    summary 'Returns all malfunctions'
    notes 'Must be logged in.'
  end
  def index
    if(logged_in?)
    @malfunctions = Malfunction.all
    end
  end

  # GET /malfunctions/1 or /malfunctions/1.json
  swagger_api :show do
    summary 'Returns a single malfunction'
    param :path, :id, :integer, :required, "Malfunction_id"
  end
  def show
  end

  # GET /malfunctions/new
  swagger_api :new do
    summary 'Returns a view for adding a malfunction'
    notes 'Must be logged in.'
  end
  def new
    if(logged_in?)
    @malfunction = Malfunction.new
    end
  end

  # GET /malfunctions/1/edit
  swagger_api :edit do
    summary 'Returns a view for editing a malfunction'
    param :path, :id, :integer, :required, "Malfunction_id"
  end
  def edit
  end

  # POST /malfunctions or /malfunctions.json
  swagger_api :create do
    summary 'Creates a malfunction'
    param :form, :id, :integer, :required, "Malfunction_id"
    param :form, :track_id, :integer, :required, "Track_id"
    param :form, :date, :date, :required, "Date"
    param :form, :time_from, :time, :required, "Time_from"
    param :form, :time_to, :time, :required, "Time_to"
    param :form, :comment, :string, "Comment"
    notes 'Must be logged in.'
  end
  def create
    if(logged_in?)
    @malfunction = Malfunction.new(malfunction_params)

    respond_to do |format|
      if @malfunction.save
        format.html { redirect_to malfunction_url(@malfunction), notice: "Malfunction was successfully created." }
        format.json { render :show, status: :created, location: @malfunction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @malfunction.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # PATCH/PUT /malfunctions/1 or /malfunctions/1.json
  swagger_api :update do
    summary 'Updates a malfunction'
    param :path, :id, :integer, :required, "Malfunction_id"
    param :form, :id, :integer, :required, "Malfunction_id"
    param :form, :track_id, :integer, :required, "Track_id"
    param :form, :date, :date, :required, "Date"
    param :form, :time_from, :time, :required, "Time_from"
    param :form, :time_to, :time, :required, "Time_to"
    param :form, :comment, :string, "Comment"
    notes 'Must be logged in.'
  end
  def update
    if(logged_in?)
    respond_to do |format|
      if @malfunction.update(malfunction_params)
        format.html { redirect_to malfunction_url(@malfunction), notice: "Malfunction was successfully updated." }
        format.json { render :show, status: :ok, location: @malfunction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @malfunction.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # DELETE /malfunctions/1 or /malfunctions/1.json
  swagger_api :destroy do
    summary 'Deletes a malfunction'
    param :path, :id, :integer, :required, "Malfunction_id"
    notes 'Must be logged in.'
  end
  def destroy
    if(logged_in?)
    @malfunction.destroy

    respond_to do |format|
      format.html { redirect_to malfunctions_url, notice: "Malfunction was successfully destroyed." }
      format.json { head :no_content }
    end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_malfunction
      @malfunction = Malfunction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def malfunction_params
      params.require(:malfunction).permit(:malfunction_id, :track_id, :date, :time_from, :time_to, :comment)
      #params.require(:malfunction).permit(:date, :time_from, :time_to, :comment)
    end
end

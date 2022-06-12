class MalfunctionsController < ApplicationController
  before_action :set_malfunction, only: %i[ show edit update destroy ]

  # GET /malfunctions or /malfunctions.json
  def index
    @malfunctions = Malfunction.all
  end

  # GET /malfunctions/1 or /malfunctions/1.json
  def show
  end

  # GET /malfunctions/new
  def new
    @malfunction = Malfunction.new
  end

  # GET /malfunctions/1/edit
  def edit
  end

  # POST /malfunctions or /malfunctions.json
  def create
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

  # PATCH/PUT /malfunctions/1 or /malfunctions/1.json
  def update
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

  # DELETE /malfunctions/1 or /malfunctions/1.json
  def destroy
    @malfunction.destroy

    respond_to do |format|
      format.html { redirect_to malfunctions_url, notice: "Malfunction was successfully destroyed." }
      format.json { head :no_content }
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

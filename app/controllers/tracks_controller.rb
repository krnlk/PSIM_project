class TracksController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_track, only: %i[ show edit update destroy ]

  swagger_controller :tracks, "Tracks"

  # GET /tracks or /tracks.json
  swagger_api :index do
    summary 'Returns all tracks'
  end
  def index
    @tracks = Track.all
  end

  # GET /tracks/1 or /tracks/1.json
  swagger_api :show do
    summary 'Returns a single track'
    param :path, :id, :integer, :required, "Track_id"
  end
  def show
  end

  # GET /tracks/new
  swagger_api :new do
    summary 'Returns new track\'s view'
  end
  def new
    @track = Track.new
  end

  # GET /tracks/1/edit
  swagger_api :edit do
    summary 'Returns the view of editing a track'
    param :path, :id, :integer, :required, "Track_id"
  end
  def edit
  end

  # POST /tracks or /tracks.json
  swagger_api :create do
    summary 'Creates a track'
    param :form, :id, :integer, :required, "Track_id"
    param :form, :error, :boolean, :required, "Error"
    notes 'Must be logged in.'
  end
  def create
    if(logged_in?)
    @track = Track.new(track_params)

    respond_to do |format|
      if @track.save
        format.html { redirect_to track_url(@track), notice: "Track was successfully created." }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
      end
    end
  end

  # PATCH/PUT /tracks/1 or /tracks/1.json
  swagger_api :update do
    summary 'Updates a track'
    param :path, :id, :integer, :required, "Track_id"
    param :form, :id, :integer, :required, "Track_id"
    param :form, :error, :boolean, :required, "Error"
    notes 'Must be logged in.'
  end
  def update
    if(logged_in?)
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to track_url(@track), notice: "Track was successfully updated." }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
      end
    end
  end

  # DELETE /tracks/1 or /tracks/1.json
  swagger_api :destroy do
    summary 'Deletes a track'
    param :path, :id, :integer, :required, "Track_id"
    notes 'Must be logged in.'
  end
  def destroy
    if(logged_in?)
    @track.destroy

    respond_to do |format|
      format.html { redirect_to tracks_url, notice: "Track was successfully destroyed." }
      format.json { head :no_content }
    end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def track_params
      #params.require(:track).permit(:id, :track_id, :error)
      params.require(:track).permit(:id, :track_id, :error)
    end
end

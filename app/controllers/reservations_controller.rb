class ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_reservation, only: %i[ show edit update destroy ]

  swagger_controller :reservations, "Reservations"

  # GET /reservations or /reservations.json
  swagger_api :index do
    summary 'Returns all reservations'
    notes 'Must be logged in'
  end
  def index
    if(logged_in?)
    @reservations = Reservation.all
    end
  end

  # GET /reservations/1 or /reservations/1.json
  swagger_api :show do
    summary 'Returns a single reservation'
    param :path, :id, :integer, :required, "Reservation_id"
    notes 'Must be logged in'
  end
  def show
    if(logged_in?)
    end
  end

  # GET /reservations/new
  swagger_api :new do
    summary 'Returns a view of a new reservation'
  end
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  swagger_api :edit do
    summary 'Returns a view of editing a reservation'
  end
  def edit
  end

  # POST /reservations or /reservations.json
  swagger_api :create do
    summary 'Creates a reservation'
    param :form, :id, :integer, :required, "Reservation_id"
    param :form, :date, :date, :required, "Date"
    param :form, :time_from, :time, :required, "Time_from"
    param :form, :time_to, :time, :required, "Time_to"
    param :form, :price_list_id, :integer, :required, "Price_list_id"
    param :form, :track_id, :integer, :required, "Track_id"
    param :form, :shoe_id, :integer, :required, "Shoe_id"
    param :form, :client_id, :integer, :required, "Client_id"
    notes 'Must be logged in.'
  end
  def create
    if(logged_in?)
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  swagger_api :update do
    summary 'Updates a reservation'
    param :path, :id, :integer, :required, "Reservation_id"
    param :form, :id, :integer, :required, "Reservation_id"
    param :form, :date, :date, :required, "Date"
    param :form, :time_from, :time, :required, "Time_from"
    param :form, :time_to, :time, :required, "Time_to"
    param :form, :price_list_id, :integer, :required, "Price_list_id"
    param :form, :track_id, :integer, :required, "Track_id"
    param :form, :shoe_id, :integer, :required, "Shoe_id"
    param :form, :client_id, :integer, :required, "Client_id"
    notes 'Must be logged in.'
  end
  def update
    if(logged_in?)
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to reservation_url(@reservation), notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  swagger_api :destroy do
    summary 'Deletes a reservation'
    param :path, :id, :integer, :required, "Reservation_id"
    notes 'Must be logged in.'
  end
  def destroy
    if(logged_in?)
    @reservation.destroy

    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      #params.require(:reservation).permit(:reservation_id, :date, :time_from, :time_to, :price_list_id, :track_id, :shoe_id, :client_id)
      params.require(:reservation).permit(:id, :reservation_id, :date, :time_from, :time_to, :price_list_id, :track_id, :shoe_id, :client_id)
    end
end

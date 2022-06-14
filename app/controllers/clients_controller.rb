class ClientsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_client, only: %i[ show edit update destroy ]

  swagger_controller :clients, "Clients"


  # GET /clients or /clients.json
  swagger_api :index do
    summary 'Returns all clients'
    notes 'Must be logged in.'
  end
  def index
    if(logged_in?)
    @clients = Client.all
    end
  end

  # GET /clients/1 or /clients/1.json
  swagger_api :show do
    summary 'Returns a client'
    param :path, :id, :integer, :required, "Client_id"
    notes 'Must be logged in.'
  end
  def show
  end

  # GET /clients/new
  swagger_api :new do
    summary 'Returns a view for adding a new client'
    notes 'Must be logged in.'
  end
  def new
    if(logged_in?)
    @client = Client.new
    end
  end

  # GET /clients/1/edit
  swagger_api :edit do
    summary 'Returns a view for editing a client'
    param :path, :id, :integer, :required, "Client_id"
    notes 'Must be logged in.'
  end
  def edit
    if(logged_in?)
    end
  end

  # POST /clients or /clients.json
  swagger_api :create do
    summary 'Creates a client'
    param :form, :id, :integer, :required, "Client_id"
    param :form, :user_datum_id, :integer, :required, "User_datum_id"
    notes 'Must be logged in.'
  end
  def create
    #@user_datum = UserDatum.find(params[:personals_id])
    if(logged_in?)
    @client = Client.new(client_params)
    end
    #@client.personals_id = @user_datum.id

    respond_to do |format|
      if(logged_in?)
      if @client.save
        format.html { redirect_to client_url(@client), notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  swagger_api :update do
    summary 'Updates a client'
    param :path, :id, :integer, :required, "Client_id"
    param :form, :id, :integer, :required, "Client_id"
    param :form, :id, :integer, :required, "User_datum_id"
    notes 'Must be logged in.'
  end
  def update
    if(logged_in?)
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to client_url(@client), notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  swagger_api :destroy do
    summary 'Deletes a client'
    param :path, :id, :integer, :required, "Client_id"
    notes 'Must be logged in.'
  end
  def destroy
    if(logged_in?)
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      #params.require(:client).permit(:client_id, :user_datum_id)
      params.require(:client).permit(:id, :user_datum_id)

    end
end

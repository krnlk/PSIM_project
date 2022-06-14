class UserDataController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_user_datum, only: %i[ show edit update destroy ]

  swagger_controller :user_data, 'UserData'

  # GET /user_data or /user_data.json
  swagger_api :index do
    summary 'Returns data of all users'
  end
  def index
    @user_data = UserDatum.all
  end

  # GET /user_data/1 or /user_data/1.json
  swagger_api :show do
    summary 'Returns single user\'s data'
    param :path, :id, :integer, :required, "User_datum_id"
  end
  def show
  end

  # GET /user_data/new
  swagger_api :new do
    summary 'Returns the view of new user\'s data'
  end
  def new
    @user_datum = UserDatum.new
  end

  # GET /user_data/1/edit
  swagger_api :edit do
    summary 'Returns the viwe of editing user\'s data'
    param :path, :id, :integer, :required, "User_datum_id"
  end
  def edit
  end

  # POST /user_data or /user_data.json
  swagger_api :create do
    summary 'Creates a student'
    param :form, :id, :integer, :required, "User_datum_id"
    param :form, :first_name, :string, :required, "First_name"
    param :form, :last_name, :string, :required, "Last_name"
    param :form, :login, :string, :required, "Login"
    param :form, :email, :string, :required, "Email"
    notes 'Must be logged in.'
  end
  def create
    @user_datum = UserDatum.new(user_datum_params)

    respond_to do |format|
      if @user_datum.save
        format.html { redirect_to user_datum_url(@user_datum), notice: "User datum was successfully created." }
        format.json { render :show, status: :created, location: @user_datum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_data/1 or /user_data/1.json
  swagger_api :update do
    summary 'Updates user\'s data'
    param :path, :id, :integer, :required, "User_datum_id"
    param :form, :id, :integer, :required, "User_datum_id"
    param :form, :first_name, :string, :required, "First_name"
    param :form, :last_name, :string, :required, "Last_name"
    param :form, :login, :string, :required, "Login"
    param :form, :email, :string, :required, "Email"
    notes 'Must be logged in.'
  end
  def update
    if(logged_in?)
    respond_to do |format|
      if @user_datum.update(user_datum_params)
        format.html { redirect_to user_datum_url(@user_datum), notice: "User datum was successfully updated." }
        format.json { render :show, status: :ok, location: @user_datum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_datum.errors, status: :unprocessable_entity }
      end
      end
    end
  end

  # DELETE /user_data/1 or /user_data/1.json
  swagger_api :destroy do
    summary 'Deletes user\'s data'
    param :path, :id, :integer, :required, "User_datum_id"
    notes 'Must be logged in.'
  end
  def destroy
    if(logged_in?)
    @user_datum.destroy

    respond_to do |format|
      format.html { redirect_to user_data_url, notice: "User datum was successfully destroyed." }
      format.json { head :no_content }
    end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_datum
      @user_datum = UserDatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_datum_params
      params.require(:user_datum).permit(:id, :user_datum_id, :first_name, :last_name, :login, :email, :password, :password_confirmation)
      #params.require(:user_datum).permit(:user_datum_id, :first_name, :last_name, :login, :email, :password, :password_confirmation)
    end
end

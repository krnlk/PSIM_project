class EmployeesController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_employee, only: %i[ show edit update destroy ]

  swagger_controller :employees, "Employees"

  # GET /employees or /employees.json
  swagger_api :index do
    summary 'Returns all employees'
    notes 'Must be logged in.'
  end
  def index
    if(logged_in?)
    @employees = Employee.all
    end
  end

  # GET /employees/1 or /employees/1.json
  swagger_api :show do
    summary 'Returns a single employee'
    param :path, :id, :integer, :required, "Employee_id"
    notes 'Must be logged in.'
  end
  def show
    if(logged_in?)
    end
  end

  # GET /employees/new
  swagger_api :new do
    summary 'Returns a view for adding a new employee'
    notes 'Must be logged in.'
  end
  def new
    if(logged_in?)
    @employee = Employee.new
    end
  end

  # GET /employees/1/edit
  swagger_api :edit do
    summary 'Returns a view for editing an employee'
    notes 'Must be logged in.'
  end
  def edit
    if(logged_in?)
    end
  end

  # POST /employees or /employees.json
  swagger_api :create do
    summary 'Creates an employee'
    param :form, :id, :integer, :required, "Employee_id"
    param :form, :user_datum_id, :integer, :required, "User_datum_id"
    notes 'Must be logged in.'
  end
  def create
    if(logged_in?)
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to employee_url(@employee), notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
      end
    end
  end

  # PATCH/PUT /employees/1 or /employees/1.json
  swagger_api :update do
    summary 'Updates an employee'
    param :path, :id, :integer, :required, "Employee_id"
    param :form, :id, :integer, :required, "Employee_id"
    param :form, :user_datum_id, :integer, :required, "User_datum_id"
    notes 'Must be logged in.'
  end
  def update
    if(logged_in?)
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to employee_url(@employee), notice: "Employee was successfully updated." }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
      end
    end
  end

  # DELETE /employees/1 or /employees/1.json
  swagger_api :destroy do
    summary 'Deletes an employee'
    param :path, :id, :integer, :required, "Employee_id"
    notes 'Must be logged in.'
  end
  def destroy
    if(logged_in?)
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url, notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employee_params
      #params.require(:employee).permit(:employee_id, :user_datum_id)
      params.require(:employee).permit(:id, :user_datum_id)
    end
end

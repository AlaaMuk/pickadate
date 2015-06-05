class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments

  def create

    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to appointments_path, notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /appointments/1
  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: 'Appointment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
    redirect_to appointments_url, notice: 'Appointment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def appointment_params
      ap step_one = params.require(:appointment).permit(:test_date, :test_time, :test_appointment)
      date = Date.parse(step_one["test_date"])
      time = Time.parse(step_one["test_time"])
      step_one["test_appointment(1i)"] = date.strftime("%Y") #year
      step_one["test_appointment(2i)"] = date.strftime("%m") #month
      step_one["test_appointment(3i)"] = date.strftime("%e") #day
      step_one["test_appointment(4i)"] = time.strftime("%I") #hour
      step_one["test_appointment(5i)"] = time.strftime("%M") #minute
      # step_one["test_appointment"].strftime("%m %e, %Y at %I:%M")
      step_one
    end
end

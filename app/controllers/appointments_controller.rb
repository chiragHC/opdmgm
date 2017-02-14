class AppointmentsController < ApplicationController

  def index
    if params[:for_date].present?
      @appointments = Appointment.for_date(params[:for_date].to_date)
    else
      @appointments = Appointment.all
    end

    render json: @appointments
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      render json: @appointment, status: :created
    else
      render :json => {:errors  => @appointment.errors.full_messages.first}
    end
  end

  def update
    @appointment = Appointment.find_by(id: params[:id])
    if @appointment.update_attributes(appointment_params)
      render json: @appointment
    else
      render :json => {:errors  => @appointment.errors.full_messages.first}
    end
  end

  def destroy
    @appointment = Appointment.find_by(id: params[:id])
    if @patient.destroy
      render json: @appointment
    else
      render :json => {:errors  => @appointment.errors.full_messages.first}
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:patient_id, :appointment_time)
  end
end

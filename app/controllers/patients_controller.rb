class PatientsController < ApplicationController

  def index
    @patients = Patient.all
    render json: @patients
  end

  def show
    @patient = Patient.find_by(id: params[:id])
    render json: @patient
  end

  def create
    @patients = Patient.new(patient_params)
    if @patients.save
      render json: @patients, status: :created
    else
      render :json => {:errors  => @patients.errors.full_messages.first}
    end
  end

  def update
    @patients = Patient.find_by(id: params[:id])
    if @patients.update_attributes(patient_params)
      render json: @patients
    else
      render :json => {:errors  => @patients.errors.full_messages.first}
    end
  end

  def destroy
    @patient = Patient.find_by(id: params[:id])
    if @patient.destroy
      render json: @patient
    else
      render :json => {:errors  => @patient.errors.full_messages.first}
    end
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :age, :gender, :mobile_number)
  end
end

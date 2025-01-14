class PatientsController < ApplicationController
  before_action :set_department
  before_action :set_patient, only: [:destroy] 

  def index
    @patients = @department.patients
  end

  def new
    @patient = @department.patients.build
  end

  def create
    @patient = @department.patients.build(patient_params)
    if @patient.save
      redirect_to root_path, notice: "Patient added successfully."  
    else
      render :new
    end
  end

  def destroy
    @patient.destroy
    redirect_to department_patients_path(@department), notice: "Patient deleted successfully."
  end

  private

  def set_department
    @department = Department.find(params[:department_id])
  end

  def set_patient
    @patient = @department.patients.find(params[:id]) 
  end

  def patient_params
    params.require(:patient).permit(:name, :age)
  end
end

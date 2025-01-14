class DepartmentsController < ApplicationController
  before_action :set_department, only: %i[show edit update destroy]

  def index
    @departments = Department.all
  end

  def show
    @patients = @department.patients
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to @department, notice: "Department created successfully."
    else
      render :new
    end
  end

  def edit
    # @department is already set by the before_action
  end

  def update
    if @department.update(department_params)
      redirect_to @department, notice: "Department updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @department.destroy
    redirect_to departments_url, notice: "Department deleted successfully."
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(:name, :description)
  end
end

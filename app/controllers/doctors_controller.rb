class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:edit, :update, :destroy]
  
  
  def index
    @pagy, @doctors = pagy(Doctor.order(:name), items: 10)
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(params_doctor)
    if @doctor.save
      redirect_to doctors_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @doctor.update(params_doctor)
      flash[:success] = "Atualizado com sucesso!"
      redirect_to doctors_path
    else
      render :edit
    end
  end

  def destroy
    if @doctor.destroy
      redirect_to root_path, status: :no_content
    else
      render :index
    end
  end

  private

  def params_doctor
    params.require(:doctor).permit(:name, :crm, :crm_uf)
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end


  
end

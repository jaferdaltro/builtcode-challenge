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
      flash[:info] = "Médico criado com sucesso"
      redirect_to root_url 
    else
      flash[:info] = "Não foi possível inserir o médico"
      render :new
    end
  end

  def edit
  end

  def update
    if @doctor.update(params_doctor)
      flash[:info] = "Atualizado com sucesso!"
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    unless @doctor.destroy
      flash[:warning] = @doctor.errors.full_messages[0] 
    end
    redirect_to root_url
  end

  private

  def params_doctor
    params.require(:doctor).permit(:name, :crm, :crm_uf)
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end


  
end

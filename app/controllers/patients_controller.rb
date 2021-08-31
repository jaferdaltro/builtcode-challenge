class PatientsController < ApplicationController
  before_action :set_patient, only: [:edit, :update, :destroy]
  
  
  def index
    @pagy, @patients = pagy(Patient.order(:name), items: 10)
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(params_patient)
    if @patient.save
      flash[:info] = "Paciente criado com sucesso"
      redirect_to patients_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(params_patient)
      flash[:info] = "Atualizado com sucesso!"
      redirect_to patients_url
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    flash[:info] = "Paciente excluido com sucesso"
    redirect_to root_url
  end

  private

  def params_patient
    params.require(:patient).permit(:name, :birth_date, :cpf)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

end

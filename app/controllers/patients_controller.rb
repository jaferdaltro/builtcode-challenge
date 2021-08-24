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
      redirect_to patients_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update(params_patient)
      flash[:success] = "Atualizado com sucesso!"
      redirect_to patients_path
    else
      render :edit
    end
  end

  def destroy
      @patient.destroy
      redirect_to root_path, status: :no_content
      flash[:danger] = "Paciente excluido com sucesso"
   
  end

  private

  def params_patient
    params.require(:patient).permit(:name, :birth_date, :cpf)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

end

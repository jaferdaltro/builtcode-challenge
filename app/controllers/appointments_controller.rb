class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:edit, :update]
  def index
    @pagy, @appointments = pagy(Appointment.order(:starts_at), items: 10)
  end
  
  
  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      flash[:info] = "Consulta agendada com sucesso"
      redirect_to appointments_url
    else
      render :new
    end
    
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      flash[:info] = "Atualizado com sucesso!"
      redirect_to appointments_url
    else
      render :edit
    end
  end

  private 

  def appointment_params
    params.require(:appointment).permit(:starts_at, :ends_at, :doctor_id, :patient_id) 
  end

  
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end

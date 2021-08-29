class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirects_to root_path
    else
      render :new
    end
    
  end

  def edit
  end

  def update
  end

  private 

  def appointment_params
    params.require(:appointment).permit(:starts_at, :doctor_id, :patient_id) 
    
  end
  
end

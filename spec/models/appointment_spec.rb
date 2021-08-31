require 'rails_helper'

RSpec.describe Appointment, type: :model do

  subject { build(:appointment) }
  
  it { is_expected.to belong_to :patient }
  it { is_expected.to belong_to :doctor }

  context "with valid paramters" do

    # Regra de negócio 7.1: O horário de atendimento é das 9 às 18, com intervalo de almoço das 12 às 13.
    it "clinic time working is between 9 and 18 regarding lunch time " do
      appointment = build(:appointment, starts_at: DateTime.new(2000,2,2,13,00), ends_at: DateTime.new(2000,2,2,13,20))
      expect(appointment).to be_valid
    end

    # Regra de negócio 7.2: Cada consulta pode durar 30 minutos.
    it "time consult shoud be until 30 minutes" do
      appointment = build(:appointment)
      expect(appointment.consult_time).to be < 30.00
    end

    # Regra de negócio 7.3: O sistema não deve permitir cadastro de uma consulta, num horário já ocupado por outra.
    it "no overlaps" do
      doctor = create :doctor
      patient = create :patient
      
      doctor.appointments.create(starts_at: DateTime.new(2000,2,2,10,00), ends_at: DateTime.new(2000,2,2,10,30), patient: patient)
      appointment = Appointment.new(starts_at: DateTime.new(2000,2,2,11,10), ends_at: DateTime.new(2000,2,2,11,40), patient: patient, doctor: doctor)
      
      expect(appointment).to be_valid
    end
  end
  
  context "with invalid paramters" do
    # Regra de negócio 7.1: O horário de atendimento é das 9 às 18, com intervalo de almoço das 12 às 13.
    it "clinic time working is between 9 and 18 regarding lunch time " do
      appointment = Appointment.new(starts_at: DateTime.new(2000,2,2,05,10), ends_at: DateTime.new(2000,2,2,05,40))
      expect(appointment).not_to be_valid
    end
    
    # Regra de negócio 7.2: Cada consulta pode durar 30 minutos.
    it "time consult shoud be until 30 minutes" do
      appointment = build(:appointment, starts_at: DateTime.new(2000,2,2,9,10), ends_at: DateTime.new(2000,2,2,11,40) )
      expect(appointment.consult_time).to_not be < 30.00
    end

    # Regra de negócio 7.3: O sistema não deve permitir cadastro de uma consulta, num horário já ocupado por outra.
    it "whith overlaps" do
      doctor = create :doctor
      patient = create :patient
      
      doctor.appointments.create(starts_at: DateTime.new(2000,2,2,10,00), ends_at: DateTime.new(2000,2,2,10,30), patient: patient)
      appointment = Appointment.new(starts_at: DateTime.new(2000,2,2,10,10), ends_at: DateTime.new(2000,2,2,10,40), patient: patient, doctor: doctor)
      
      expect(appointment).to_not be_valid
    end
    
  end
  
  

  

    
  
end

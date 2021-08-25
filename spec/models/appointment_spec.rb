require 'rails_helper'

RSpec.describe Appointment, type: :model do
  
  describe "associations" do
    it { should belong_to :patient }
    it { should belong_to :doctor }
  end
  
  describe "validations" do
    it { should validate_presence_of(:starts_at) }
    it { should validate_presence_of(:ends_at) }
    
    it "no overlaps" do
      doctor = create :doctor
      patient = create :patient
  
      doctor.appointments.create(starts_at: Time.now, ends_at: Time.now + 30.minutes, patient: patient)
      appointment = Appointment.new(starts_at: Time.now + 5.minutes, ends_at: Time.now + 35.minutes, patient: patient, doctor: doctor)
      
      expect(appointment).not_to be_valid
    end

  end

end

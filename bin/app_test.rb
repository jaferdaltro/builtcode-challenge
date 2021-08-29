ENV['RAILS_ENV'] = 'development'
require_relative '../config/environment.rb'



appointment = Appointment.new(starts_at: DateTime.new(2000,2,2,12,31), 
              ends_at: DateTime.new(2000,2,2,13,00), patient: Patient.last, doctor: Doctor.find(11))


ap appointment.valid?



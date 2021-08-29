class VacantnessValidator < ActiveModel::EachValidator
  
  def validate_each(record, attribute, value)
    appointments = Appointment.where(["doctor_id = ?", record.doctor_id])
    slots = appointments.map { |a| a.starts_at..a.ends_at }

    slots.each do |slot|
      if slot.cover? value
        record.errors.add(attribute, "esse horário está ocupado")
      end
    end
    
  end
  
end 
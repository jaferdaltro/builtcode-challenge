class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  attribute :consult_time

  validates :starts_at, :ends_at, presence: true, vacantness: true
  validate :service_time, :consultation_time

  def consult_time
    consult_timme = TimeDifference.between(starts_at, ends_at).in_minutes
  end
  

  private
    
  # Regra de negócio 7.1: O horário de atendimento é das 9 às 18, com intervalo de almoço das 12 às 13.
    def service_time
      start_time = DateTime.new(starts_at.year, starts_at.month, starts_at.day, 9,00)
      end_time = DateTime.new(starts_at.year, starts_at.month, starts_at.day, 18, 00)
      journey = start_time..end_time

      start_lunch =  DateTime.new(starts_at.year, starts_at.month, starts_at.day, 12, 00)
      end_lunch =  DateTime.new(starts_at.year, starts_at.month, starts_at.day, 13, 00)
      lunch = start_lunch..end_lunch

      consult_time = starts_at..ends_at

      unless journey.cover? consult_time and !lunch.cover? consult_time
        errors.add(:base, "Fora de horário")
      end
      
    end
    
    # Regra de negócio 7.2: Cada consulta pode durar 30 minutos.
    def consultation_time
      unless consult_time <= 30
        errors.add(:base, "A consulta só pode ter até 30 minutos")
      end
    end

 
end

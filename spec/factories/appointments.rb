FactoryBot.define do
  factory :appointment do
    starts_at { DateTime.new(2000,2,2,10,00) }
    ends_at { DateTime.new(2000,2,2,10,28) }
    doctor
    patient

    
  end
end
